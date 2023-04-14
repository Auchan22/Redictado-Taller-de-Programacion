/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import practica2.Persona;
import PaqueteLectura.Lector;

/**
 *
 * @author agust
 */
public class ejercicio1 {
    public static void main(String[] args){
        
        
        System.out.println("---");
        System.out.print(" -> Ingrese nombre de la persona: ");
        String n = Lector.leerString();
        System.out.print(" -> Ingrese edad de la persona: ");
        int e = Lector.leerInt();
        System.out.print(" -> Ingrese DNI de la persona: ");
        int dni = Lector.leerInt();
        System.out.println("---");
        Persona p = new Persona(n, dni, e);
        System.out.println(" ");
        System.out.println(p.toString());
    }
}
