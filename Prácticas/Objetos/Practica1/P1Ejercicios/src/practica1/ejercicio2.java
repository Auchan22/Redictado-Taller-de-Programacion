/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;

import PaqueteLectura.Lector;

/**
 *
 * @author agust
 */
public class ejercicio2 {
    
    public static boolean esMayor(double alt, double prom){
        return alt > prom;
    }
    
    public static void cargarVector(double[] v, int df, double totalSum){
        int i;
        for (i = 0; i < df;i++){
            System.out.println("Ingrese altura del jugador: " + (i+1));
            v[i] = Lector.leerDouble();
            totalSum = totalSum + v[i];
        }
    }
    
    public static double promedio(double totalSum, int df){
        return totalSum / df;
    }
    
    public static int recorrerVector(double[] v, int df, double prom){
        int cant = 0;
        int i;
        for(i = 0; i < df; i++){
            if(esMayor(v[i], prom)){
                cant = cant + 1;
            }
        }
        return cant;
    }
    
    public static void main(String[] args) {
    
        
        int DF = 15;
        double totalSum = 0;
        
        //Paso 2: Declarar la variable vector de double 
        double[] arr;
        
        //Paso 3: Crear el vector para 15 double 
        arr = new double[DF];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        cargarVector(arr, DF, totalSum);
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        double prom = promedio(totalSum, DF);
        System.out.println("El promedio de altura es: "+ prom);
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        
        int cant = recorrerVector(arr, DF, prom);
     
        //Paso 9: Informar la cantidad.
        System.out.println("Cantidad de jugadores con altura mayor al promedio: "+ prom+ " son: "+ cant);
    }
    
}
