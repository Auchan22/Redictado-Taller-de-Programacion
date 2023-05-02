/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3;

/**
 *
 * @author agust
 */
public class Fecha {
    private String ciudad, dia;
    
    public Fecha(String c, String d){
        this.ciudad = c;
        this.dia = d;
    }
    
    public String getCiudad(){
        return this.ciudad;
    }
    
    public String getDia(){
        return this.dia;
    }
}
