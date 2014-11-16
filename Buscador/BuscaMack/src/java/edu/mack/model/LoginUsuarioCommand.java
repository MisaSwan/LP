/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.model;

import edu.mack.DAO.UsuarioDaoImpl;
import edu.mack.entity.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 31327291
 */
public class LoginUsuarioCommand implements Command {

    UsuarioDaoImpl daoimpl = new UsuarioDaoImpl();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contador;
        //contador = Integer.parseInt((String)request.getSession().getAttribute("contador"));
        //request.getSession().setAttribute("contador", contador++);        

        String login = request.getParameter("usernameLogin");
        String pass = request.getParameter("passLogin");
        String msgError = "";
        boolean hasError = false;

        if (login == null || pass == null) {
            hasError = true;
            msgError = "Login ou senha inválidos";
        }

        if (!hasError) {
            Usuario userToLoad = new Usuario();
            userToLoad.setLogin(login);
            userToLoad.setSenha(pass);
            Usuario userFromDB = new Usuario();
            userFromDB = daoimpl.obterPorLogin(userToLoad);
            if (userFromDB.getLogin() != null) {
                userFromDB.setLogado(true);
                request.getSession().setAttribute("usuarioLogado", userFromDB);
                Cookie c = new Cookie("OnlineUser", userFromDB.getLogin());
                response.addCookie(c);                
                response.sendRedirect("products.jsp");                
            } else {
                msgError = "Usuario não encontrado";
            }
        }else
        {
         request.getSession().setAttribute("ErrorLogin", msgError);
         response.sendRedirect("index.jsp");
        }

    }

}
