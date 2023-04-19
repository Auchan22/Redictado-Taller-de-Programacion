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
public class ejercicio5 {
    
    public static Circulo leerCirculo(){
        String cL, cR;
        double r;
        System.out.println("---");
        System.out.println("Leyendo datos del circulo...");
        System.out.print(" -> Ingrese radio del circulo: ");
        r = Lector.leerDouble();
        System.out.print(" -> Ingrese color de linea: ");
        cL = Lector.leerString();
        System.out.print(" -> Ingrese color de relleno: ");
        cR = Lector.leerString();
        System.out.println("---");
        
        return new Circulo(r, cR, cL);
    }
    
    public static void main(String[] args){
        Circulo C = leerCirculo();
        
        System.out.println(" Perimetro del circulo: "+ C.calcularPerimetro());
        System.out.println(" Area del circulo: "+ C.calcularArea());
    }
}
