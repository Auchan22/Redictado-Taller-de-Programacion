/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

/**
 *
 * @author agust
 */
public class Auto {
    private String dueño;
    private int patente;
    
    public Auto(String d, int p){
        this.dueño = d;
        this.patente = p;
    }

    public String getDueño() {
        return dueño;
    }

    public int getPatente() {
        return patente;
    }
    
    public String toString(){
        String aux = "Dueño: "+this.getDueño() + " | Patente: "+this.getPatente();
        return aux;
    }
}
