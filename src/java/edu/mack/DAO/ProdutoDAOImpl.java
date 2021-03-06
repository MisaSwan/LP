/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.DAO;

import entities.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 31327291
 */
public class ProdutoDAOImpl implements ProdutoDAO {

    @Override
    public List<Product> searchProducts(String category, String price) {
        try {
            String query = "";

            if (!category.equals("")) {
                query = "where categoria like '%" + category + "%'";
            }
            if (!price.equals("") && price.equals("max")) {
                query += "order by preco desc";
            }
            Connection connection = UtilDAO.getConn();
            List<Product> productList = new ArrayList<Product>();
            String sql = "Select * from produto " + query;
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("nome"));
                product.setPrice(rs.getDouble("preco"));
                product.setDescription(rs.getString("descricao"));
                product.setImage(rs.getString("imagem"));
                productList.add(product);

            }
            return productList;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Product> loadProducts() {
        try {
            Connection connection = UtilDAO.getConn();
            String sql = "Select * from Produto";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            List<Product> products = new ArrayList();
            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("nome"));
                product.setPrice(rs.getDouble("preco"));
                product.setDescription(rs.getString("descricao"));
                product.setImage(rs.getString("imagem"));
                products.add(product);
            }
            return products;
        } catch (Exception e) {
            return null;
        }
    }

    public List<String> loadCategories() {
        List<String> listCategories = new ArrayList<>();

        try {
            Connection conn = UtilDAO.getConn();
            String cmd = "SELECT DISTINCT categoria FROM PRODUTO";
            PreparedStatement ps = conn.prepareStatement(cmd);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                listCategories.add(rs.getString("categoria"));
            }

            return listCategories;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Product> filterProductsByCategory(String category) {

        try {
            Connection connection = UtilDAO.getConn();
            String sql = "Select * from Produto where categoria like '%"+category+"%'";
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            ResultSet rs = stmt.executeQuery();
            List<Product> products = new ArrayList();
            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("nome"));
                product.setPrice(rs.getDouble("preco"));
                product.setDescription(rs.getString("descricao"));
                product.setImage(rs.getString("imagem"));
                products.add(product);
            }
            return products;
        } catch (Exception e) {
            return null;
        }

    }

    @Override
    public List<Product> filterProductsByPrice(boolean minorPrice) {
        try {
            String orderBy = "";
            if (!minorPrice) {
                orderBy = "order by preco desc";
            }
            Connection connection = UtilDAO.getConn();
            String sql = "Select * from Produto "+orderBy;
            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            List<Product> products = new ArrayList();
            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("nome"));
                product.setPrice(rs.getDouble("preco"));
                product.setDescription(rs.getString("descricao"));
                product.setImage(rs.getString("imagem"));
                products.add(product);
            }
            return products;
        } catch (Exception e) {
            return null;
        }

    }

    @Override
    public List<Product> filterProductsByName(String name) {
        try {
            Connection connection = UtilDAO.getConn();
            String sql = "Select * from Produto where nome like '%"+name+"%'";
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            ResultSet rs = stmt.executeQuery();
            List<Product> products = new ArrayList();
            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("nome"));
                product.setPrice(rs.getDouble("preco"));
                product.setDescription(rs.getString("descricao"));
                product.setImage(rs.getString("imagem"));
                products.add(product);
            }
            return products;
        } catch (Exception e) {
            return null;
        }
        
    }

}
