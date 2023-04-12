/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;

import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author agust
 */
public class ejercicio5 {
    
    public static void inicializarMatriz(int[][] m, int f, int c){
        for(int i = 0; i < f; i++){
            for(int j = 0; j < c; j++){
                m[i][j] = 0;
            }
        }
    }
    
    public static void cargarMatriz(int[][] m, int df){
        for(int i = 0; i < df; i++){
            System.out.println(" ");
            System.out.println("Leyendo datos del cliente: "+(i + 1));
            System.out.println("---");
            //J es la fila, es decir, los aspectos
            //P es la columna, es decir, el puntaje
            for(int j = 0; j < 4; j++){
                int p = GeneradorAleatorio.generarInt(10);
                // System.out.println(" -> Ingrese puntaje del aspecto " +j+": ");
                // int p = Lector.leerInt();
                //En la carga, a p se le deberia restar 1
                System.out.println(" -> Puntaje del aspecto: "+ j+ " es: "+ (p+1));
                m[j][p] = m[j][p] + 1;
            }
            System.out.println("---");
            System.out.println(" ");
        }
    }
    
    public static double promedio(int t, int df){
        return t/df;
    }
    
    public static void calcularPromedio(int[][] m ){
        for(int i = 0; i < 4; i++){
            int totalAspecto = 0;
            for(int j = 0; j < 10; j++){
                totalAspecto = totalAspecto + (m[i][j] * (j+1));
            }
            double prom = promedio(totalAspecto, 5);
            System.out.println(" -> El puntaje promedio para el aspecto "+i+" es: "+ prom);
        }
    }
    
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        
        int CLIENTES = 5;
        int PUNTAJE = 10;
        int ASPECTOS = 4; 
        
        int[][] m = new int[ASPECTOS][PUNTAJE];
        
        inicializarMatriz(m, ASPECTOS, PUNTAJE);
        
        cargarMatriz(m, CLIENTES);
        
        calcularPromedio(m);
    }
}
