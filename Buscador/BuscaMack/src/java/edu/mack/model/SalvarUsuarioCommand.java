/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.model;

import edu.mack.DAO.UsuarioDaoImpl;
import edu.mack.entity.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author 31327291
 */
public class SalvarUsuarioCommand implements Command {

    UsuarioDaoImpl daoimpl = new UsuarioDaoImpl();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario user = new Usuario();
        boolean hasError = false;
        ArrayList msgError = new ArrayList();

        String name = request.getParameter("nameRegister");
        String cpf = request.getParameter("cpfRegister");
        String login = request.getParameter("userRegister");
        String password = request.getParameter("passRegister");
        String email = request.getParameter("emailRegister");
        String gender = request.getParameter("sexRegister");
        String age = request.getParameter("ageRegister");


        user.setNome(name);
        user.setCpf(cpf);
        user.setLogin(login);
        user.setSenha(password);
        user.setEmail(email);
        user.setGender(gender);
        user.setAge(Integer.parseInt(age));


        if (!hasError) {
            daoimpl.salvar(user);
            Usuario userFromDB = daoimpl.obterPorLogin(user);
            if (userFromDB.getLogin() != null) {
                userFromDB.setLogado(true);
                request.getSession().setAttribute("usuarioLogado", userFromDB);
                Cookie c = new Cookie("OnlineUser", userFromDB.getLogin());
                response.addCookie(c);                
                response.sendRedirect("products.jsp"); 
            }else
            {
                response.sendRedirect("register.jsp");
            }
        } else {            
            response.sendRedirect("register.jsp");

        }

    }
}
