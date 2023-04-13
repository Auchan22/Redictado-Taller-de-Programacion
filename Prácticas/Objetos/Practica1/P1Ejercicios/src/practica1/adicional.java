/*
1- a) Simular la entrada de autos al estacionamiento municipal en el centro de la ciudad.
El estacionamiento está dividido en 5 pisos y cada piso tiene 10 plazas.
Realice un programa que genere aleatoriamente números (patentes) hasta el 0. Por cada
patente generada, debe leer por teclado el número de piso y número de plaza donde
debe estacionar el auto, debiendo marcar ese lugar como ocupado en una estructura de
datos adecuada.
Nota: Al principio todas las plazas del estacionamiento deben marcarse desocupadas.
Además, durante la lectura, puede considerar que el lugar leído (número de piso,
número de plaza) está desocupado y dichos números son válidos.
b) Informe cuál es el piso más ocupado.
 */
package practica1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author agust
 */
public class adicional {

    public static void inicializarMatriz(boolean[][] m, int f, int c) {
        for (int i = 0; i < f; i++) {
            for (int j = 0; j < c; j++) {
                m[i][j] = false;
            }
        }
    }

    public static void cargarMatriz(boolean[][] m) {
        int patente = GeneradorAleatorio.generarInt(10);
        System.out.println("---");
        while (patente != 0) {
            System.out.println(" -> Leyendo datos de la Patente: " + patente);
            System.out.println(" ");
            System.out.print(" -> Ingrese nro de piso (1-5):");
            int piso = Lector.leerInt();
            System.out.print(" -> Ingrese nro de plaza (1-10):");
            int plaza = Lector.leerInt();
            //if(m[(piso-1)][plaza-1] != true){
            m[(piso - 1)][(plaza - 1)] = true;
            //}else{
            //System.out.println("El piso esta ocupado :(");
            //}
            System.out.println(" ");
            patente = GeneradorAleatorio.generarInt(10);
        }

        System.out.println("---");
    }

    public static void encontrarPisoMax(boolean[][] m, int f, int c) {
        int maxOcupado = -1, maxPiso = 0;
        for (int i = 0; i < f; i++) {
            int cantOcupado = 0;
            for (int j = 0; j < c; j++) {
                if (m[i][j] == true) {
                    cantOcupado = cantOcupado + 1;
                }
            }
            if (cantOcupado > maxOcupado) {
                maxOcupado = cantOcupado;
                maxPiso = i + 1;
            }
        }
        System.out.println("El piso " + maxPiso + " es el más ocupado, con una ocupación total de: " + maxOcupado);
    }

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int PISOS = 5;
        int PLAZAS = 10;

        //true significado ocupado, false desocupado
        boolean[][] m = new boolean[PISOS][PLAZAS];

        inicializarMatriz(m, PISOS, PLAZAS);
        cargarMatriz(m);

        encontrarPisoMax(m, PISOS, PLAZAS);
    }
}
