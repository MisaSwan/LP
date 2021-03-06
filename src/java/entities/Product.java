/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author milan
 */
@Entity
@Table(name = "PRODUTO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
    @NamedQuery(name = "Product.findAllWithText", query = "SELECT p FROM Product p WHERE p.name like :name")
/*    @NamedQuery(name = "Product.findByName", query = "SELECT p FROM ECOMMERCE.PRODUTO p WHERE p.NOME = :name")
    @NamedQuery(name = "Product.findByAddressline1", query = "SELECT p FROM ECOMMERCE.PRODUTO p WHERE p.PRECO = :price"),
    @NamedQuery(name = "Product.findByAddressline2", query = "SELECT p FROM ECOMMERCE.PRODUTO p WHERE p.DESCRICAO = :description"),
    @NamedQuery(name = "Product.findByCity", query = "SELECT p FROM ECOMMERCE.PRODUTO p WHERE p.IMAGEM = :image"),
    @NamedQuery(name = "Product.findByState", query = "SELECT p FROM ECOMMERCE.PRODUTO p WHERE p.CATEGORIA = :category")*/
})

public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer productId;
    @Size(max = 100)
    @Column(name = "NOME")
    private String name;    
    @Column(name = "PRECO")
    private double price;
    @Size(max = 100)
    @Column(name = "DESCRICAO")
    private String description;
    @Size(max = 100)
    @Column(name = "IMAGEM")
    private String image;    
    @Size(max = 100)
    @Column(name = "CATEGORIA")
    private String category;
    
    public Product() {
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Product[ productId=" + productId + " ]";
    }
    
}
