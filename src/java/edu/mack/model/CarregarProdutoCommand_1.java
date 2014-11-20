/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.model;

import edu.mack.DAO.ProdutoDAOImpl;

import entities.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 31327291
 */
public class CarregarProdutoCommand_1 implements Command {

    ProdutoDAOImpl produtoDAO;

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        System.out.println("==============================================================");
        
        produtoDAO = new ProdutoDAOImpl();        
        List<Product> products = produtoDAO.loadProducts();
        request.getSession().setAttribute("categories", produtoDAO.loadCategories());
        request.getSession().setAttribute("products", products);    
        String jspName = request.getParameter("jspName");
        response.sendRedirect(jspName+".jsp#&loaded");
    }

}
