/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 31327291
 */
public class LogoutUsuarioCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                
        if (request.getCookies() != null) {
            for (Cookie c : request.getCookies()) {
                if (c.getName().equals("OnlineUser")) {
                    c.setMaxAge(0);
                    c.setValue("--");
                    response.addCookie(c);
                }
            }
        }
        System.out.println("teste");
        request.getSession().removeAttribute("usuarioLogado");        
        response.sendRedirect("index.jsp");
    }

}
