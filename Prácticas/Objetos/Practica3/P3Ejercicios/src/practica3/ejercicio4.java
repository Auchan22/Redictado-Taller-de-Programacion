/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author agust
 */
public class ejercicio4 {

    public static Cliente leerCliente() {
        String n;
        int dni, edad;
        System.out.println("---");
        System.out.println("Leyendo informacion del cliente...");
        System.out.print(" -> Ingrese Nombre del cliente: ");
        n = Lector.leerString();
        System.out.print(" -> Ingrese DNI del cliente: ");
        dni = Lector.leerInt();
        System.out.print(" -> Ingrese Edad del cliente: ");
        edad = Lector.leerInt();
        return new Cliente(n, dni, edad);
    }

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DIMF = 10;
        Hotel H = new Hotel(DIMF);

        for (int i = 0; i < 5; i++) {
            Cliente c = leerCliente();
            System.out.print(" -> Ingrese nro de habitacion: ");
            int nro = Lector.leerInt();
            System.out.println("---");

            H.ingresarCliente(c, nro);
        }

        System.out.println(H.toString());
        
        System.out.println(" ");
        System.out.println("Provocar aumento");
        System.out.print(" -> Ingrese monto el aumento: ");
        int monto = Lector.leerInt();
        H.aumentarPrecio(monto);
        System.out.println(" ");
        
        System.out.println(H.toString());
    }
}
