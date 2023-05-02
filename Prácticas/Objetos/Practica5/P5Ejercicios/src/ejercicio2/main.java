/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author agust
 */
public class main {
    public static Auto leerAuto(){
        String d = GeneradorAleatorio.generarString(7);
        int p = GeneradorAleatorio.generarInt(1000) + 1000;
        System.out.println("");
        System.out.println(" -> Ingrese nombre del dueño: "+d);
        System.out.println(" -> Ingrese numero de patente: "+p);
        System.out.println("");
        
        return new Auto(d, p);
    }
    
    public static void cargarEstacionamiento(Estacionamiento E){
        for(int i = 0; i < 5; i++){
            int X = GeneradorAleatorio.generarInt(3) + 1, Y = GeneradorAleatorio.generarInt(3) + 1;
            System.out.println("---");
            System.out.println("Cargando auto: "+(i+1));
            Auto a = leerAuto();
            System.out.println("  Piso: "+(X)+ " | Plaza: "+Y);
            E.registrarAuto(a, X, Y);
            System.out.println("---");
        }
    }
    
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        Estacionamiento E = new Estacionamiento("Los Paraguas", "Vicente Lopez 1234", "09:30", "23:30", 3, 3);
        
        cargarEstacionamiento(E);
        
        System.out.println("");
        System.out.println(E.toString());
        System.out.println("");
        System.out.println("Nro de autos en la Plaza 1: "+E.cantidadEnPlaza(1));
        System.out.println("");
        System.out.print(" -> Ingrese patente del auto a buscar: ");
        int p = Lector.leerInt();
        System.out.println(E.encontrarAutoByPatente(p));
    }
}
