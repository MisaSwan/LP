/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Paloma
 */
@XmlRootElement(name = "products")
public class Products {
    
     @XmlElement(name = "product")
 private List<Product> products = null;
 
    public List<Product> getProducts() {
        return products;
    }     
}
