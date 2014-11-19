/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities.service;

import entities.Product;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author milan
 */
@Stateless
@Path("entities.product")
public class ProductFacadeREST extends AbstractFacade<Product> {
    @PersistenceContext(unitName = "ProductDBPU")
    private EntityManager em;

    public ProductFacadeREST() {
        super(Product.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Product entity) {
        super.create(entity);
    }

    @PUT
    @Override
    @Consumes({"application/xml", "application/json"})
    public void edit(Product entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({"application/xml", "application/json"})
    public Product find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Product> findAll() {
        return super.findAll();
    }
    
    
    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Product> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }

    @GET 
    @Path("search/{text}") 
    @Produces({"application/xml", "application/json"}) 
    public List<Product> findByText(@PathParam("text") String text) {        
        return (List<Product>) em.createNamedQuery("Product.findAllWithText").setParameter("name", "%"+text+"%").getResultList(); 
    } 
    
        @GET 
    @Path("search") 
    @Produces({"application/xml", "application/json"}) 
    public List<Product> findByBlankText() {        
        return super.findAll();
    } 
    
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
