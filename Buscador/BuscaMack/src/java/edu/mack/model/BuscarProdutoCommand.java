/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.model;

import edu.mack.entity.*;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;

/**
 *
 * @author 31327291
 */
public class BuscarProdutoCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<String> ecommerces = new ArrayList();
        ecommerces.add("http://localhost:8080/Ecommerce/webresources/entities.product/search/");
        // ecommerces.add("http://localhost:8081/Ecommerce/webresources/entities.product/search/");
        List<Product> productsAll = new ArrayList();
        for (String uri : ecommerces) {
            String text = request.getParameter("textLike");
            URL url = new URL(uri + text);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/xml");
            Products products = null;
            try {
                JAXBContext jc = JAXBContext.newInstance(Products.class);
                InputStream xml = connection.getInputStream();

                products = (Products) jc.createUnmarshaller().unmarshal(xml);
            } catch (JAXBException ex) {
                Logger.getLogger(BuscarProdutoCommand.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (products.getProducts() != null) {
                for (Product product : products.getProducts()) {
                    productsAll.add(product);
                }
            }
            connection.disconnect();
        }
        Collections.sort(productsAll, new Comparator<Product>() {
            @Override
            public int compare(Product one, Product another) {
                int returnVal = 0;

                if (one.getPrice() < another.getPrice()) {
                    returnVal = -1;
                } else if (one.getPrice() > another.getPrice()) {
                    returnVal = 1;
                } else if (one.getPrice() == another.getPrice()) {
                    returnVal = 0;
                }
                return returnVal;

            }
        });
        for (Product p : productsAll) {
            System.out.println(p.getName() + " " + p.getPrice());
        }

        request.getSession().setAttribute("products", productsAll);
        response.sendRedirect("products.jsp");
    }

}
