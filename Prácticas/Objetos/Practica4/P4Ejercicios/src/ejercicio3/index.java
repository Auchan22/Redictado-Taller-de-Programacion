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
public class index {
    public static void main(String[] args){
        Persona P = new Persona("Juancito", 44831461, 29);
        
        Trabajador T = new Trabajador( "Verdulero","Saul", 123456, 45);
        
        System.out.println(P.toString());
        System.out.println(T.toString());
    }
}
