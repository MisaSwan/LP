/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;

/**
 *
 * @author Paloma
 */
public class Teste {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws MalformedURLException, IOException, JAXBException {
       String uri = "http://localhost:8080/ECommerce/webresources/entities.product";
       URL url = new URL(uri);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Accept", "application/xml");

        JAXBContext jc = JAXBContext.newInstance(Products.class);
        InputStream xml = connection.getInputStream();
        Products customers = (Products) jc.createUnmarshaller().unmarshal(xml);
        for(Product product : customers.getProducts()){
            System.out.println(product.getName());
        }
        connection.disconnect();
    }

}
