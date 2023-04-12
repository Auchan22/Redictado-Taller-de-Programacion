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
public class ejercicio4 {

    public static void inicializarMatriz(int[][] m, int p, int o) {
        int i, j;
        for (i = 0; i < p; i++) {
            for (j = 0; j < o; j++) {
                m[i][j] = 0;
            }
        }
    }

    /*public static int[] leerPersona() {
        int p, o;
        int[] v = new int[2];
        System.out.println("---");
        //p = GeneradorAleatorio.generarInt(9);
        System.out.print(" -> Ingrese Nro de piso: ");
        p = Lector.leerInt();
        if (p != 9) {
            //o = GeneradorAleatorio.generarInt(4);
            System.out.print(" -> Ingrese Nro de Oficina: ");
            o = Lector.leerInt();
            v[0] = p;
            v[1] = o;
        }
        System.out.println("---");
        return v;
    }*/
    public static void cargarMatriz(int[][] m) {
        int p = 0, o = 0;

        System.out.print(" -> Ingrese Nro de piso: ");
        p = Lector.leerInt();

        while (p != 9) {
            if (p != 9) {
                //o = GeneradorAleatorio.generarInt(4);
                System.out.print(" -> Ingrese Nro de Oficina: ");
                o = Lector.leerInt();
                System.out.println("---");
            }
            m[p - 1][o - 1] = m[p - 1][o - 1] + 1;
            System.out.println("---");
            System.out.print(" -> Ingrese Nro de piso: ");
            p = Lector.leerInt();

        }
        System.out.println("Matriz cargada...");
    }

    public static void imprimirMatriz(int[][] m, int p, int o) {
        int i, j;
        for (i = 0; i < p; i++) {
            for (j = 0; j < o; j++) {
                System.out.println("---");
                System.out.println(" -> Nro de personas en la oficina: " + (j + 1) + ", en el piso: " + (i + 1) + " es: " + m[i][j]);
                System.out.println("---");
            }
        }
    }

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int PISOS = 8;
        int OFI = 4;

        int[][] m = new int[PISOS][OFI];
        inicializarMatriz(m, PISOS, OFI);
        cargarMatriz(m);

        imprimirMatriz(m, PISOS, OFI);
    }
}
