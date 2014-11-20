/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.DAO;

import entities.Product;
import entities.Product;
import java.util.List;

/**
 *
 * @author 31327291
 */
public interface ProdutoDAO {
 
    public List<Product> searchProducts(String category, String price);
    public List<Product> loadProducts();
    public List<Product> filterProductsByCategory(String category);
    public List<Product> filterProductsByPrice(boolean minorPrice);
    public List<Product> filterProductsByName(String name);
}
