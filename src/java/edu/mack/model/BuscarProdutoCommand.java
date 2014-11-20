/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.model;

import edu.mack.DAO.ProdutoDAOImpl;
import entities.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 31327291
 */
public class BuscarProdutoCommand implements Command{

    ProdutoDAOImpl produtoDAO;
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        produtoDAO = new ProdutoDAOImpl();
        String category = request.getParameter("category");
        String price = request.getParameter("FilterPrice");
        List<Product> products = produtoDAO.searchProducts(category,price);
        request.setAttribute("productsList", products);
    }
    
}
