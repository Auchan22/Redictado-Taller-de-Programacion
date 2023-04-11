/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author agust
 */
public class ejercicio3 {

    public static void cargarMatriz(int[][] m, int df) {
        int MAXRANDOM = 30;
        int i, j;
        for (i = 0; i < df; i++) {
            for (j = 0; j < df; j++) {
                int n = GeneradorAleatorio.generarInt(MAXRANDOM + 1);
                System.out.println("Numero generado: " + n + " en la pos: " + (i+1) + " | " +(j+1) );
                m[i][j] = n;
            }
        }
    }

    public static void totalFila1(int[][] m) {
        int j;
        int df = 5;
        int total = 0;
        for (j = 0; j < df; j++) {
            total = total + m[0][j];
        }
        System.out.println("El total de los elementos en la fila 1 es: " + total);
    }

    public static void generarVector(int[] v, int[][] m, int df) {
        int i, j;

        for (j = 0; j < df; j++) {
            int totalColumna = 0;
            for (i = 0; i < df; i++) {
                totalColumna = totalColumna +  m[i][j];
            }
            v[j] = totalColumna;
        }

    }

    public static void imprimirVector(int[] v, int df) {
        int i;
        for (i = 0; i < df; i++) {
            System.out.println("Imprimiendo la pos: " + i + " | Total: " + v[i]);
        }
    }

    public static int leerValor() {
        int b;
        System.out.println("---");
        System.out.print("-> Ingrese valor a buscar: ");
        b = Lector.leerInt();
        System.out.println("---");
        return b;
    }

    public static void buscarValor(int[][] m, int df) {
        int bus;
        boolean ok = false;
        bus = leerValor();
        int i, j;
        int f = 0, c = 0;
        for(i = 0; i < df; i++){
            for(j = 0; j < df; j++){
                if(m[i][j] == bus){
                    ok = true;
                    f = i;
                    c = j;
                }
            }
        }
        if(ok){
            System.out.println("El valor "+ bus+ " se encuentra en las coordenadas: "+(f+1)+ " | "+ (c+1));
        }else{
            System.out.println("El valor buscado no se encuentra");
        }
    }

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int DIMF = 5;

        int[][] matriz = new int[DIMF][DIMF];

        //Cargando Matriz
        cargarMatriz(matriz, DIMF);

        //Suma fila 1
        totalFila1(matriz);

        //Generar Vector
        int[] v = new int[DIMF];

        generarVector(v, matriz, DIMF);
        System.out.println(" ");
        imprimirVector(v, DIMF);

        //Busqueda de un valor en la matriz
        buscarValor(matriz, DIMF);

    }
}
