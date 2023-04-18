/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

import PaqueteLectura.Lector;

/**
 *
 * @author agust
 */
public class ejercicio1 {

    
    public static Triangulo leerTriangulo(){
        double l1, l2, l3;
        String cR, cL;
        System.out.println("---");
        System.out.println("Leyendo datos del triangulo...");
        System.out.print(" -> Longitud del lado 1: ");
        l1 = Lector.leerDouble();
        System.out.print(" -> Longitud del lado 2: ");
        l2 = Lector.leerDouble();
        System.out.print(" -> Longitud del lado 3: ");
        l3 = Lector.leerDouble();
        System.out.print(" -> Color del relleno: ");
        cR = Lector.leerString();
        System.out.print(" -> Color de la linea: ");
        cL = Lector.leerString();
        System.out.println("---");
        
        return new Triangulo(l1, l2, l3, cR, cL);
    }
    
    
    public static void main(String[] args) {
        Triangulo T = leerTriangulo();
        System.out.println(" ");
        System.out.println(" -> Perimetro del triangulo: "+ T.calcularPerimetro());
        System.out.println(" -> Area del triangulo: "+ T.calcularArea());
    }
    
}
