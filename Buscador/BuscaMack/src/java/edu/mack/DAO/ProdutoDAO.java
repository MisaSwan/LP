/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.DAO;

import edu.mack.entity.Produto;
import java.util.List;

/**
 *
 * @author 31327291
 */
public interface ProdutoDAO {
 
    public List<Produto> searchProducts(String category, String price);
    public List<Produto> loadProducts();
}
