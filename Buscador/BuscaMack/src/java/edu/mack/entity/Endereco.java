/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.mack.entity;

/**
 *
 * @author 31327291
 */
public class Endereco {

    String addressStreet;
    String addressNumber;
    String addressCompl;
    String addressNeighborhood;
    String addressCity;

    public Endereco(String addressStreet, String addressNumber, String addressCompl, String addressNeighborhood, String addressCity) {
        this.addressStreet = addressStreet;
        this.addressNumber = addressNumber;
        this.addressCompl = addressCompl;
        this.addressNeighborhood = addressNeighborhood;
        this.addressCity = addressCity;
    }
    @Override
    public String toString(){
        return this.addressStreet + " "+ this.addressNumber + " "+ this.addressCompl + " "+
            this.addressNeighborhood + " "+ this.addressCity;
    }
}
