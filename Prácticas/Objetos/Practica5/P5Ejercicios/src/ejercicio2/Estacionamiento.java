/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

/**
 *
 * @author agust
 */
public class Estacionamiento {

    private String nombre, direccion, hApertura, hCierre;
    private int PISO, PLAZA;
    private Auto[][] mAutos;
    private int DIMF;

    public Estacionamiento(String n, String d) {
        this.nombre = n;
        this.direccion = d;
        this.PISO = 5;
        this.PLAZA = 10;
        this.DIMF = 0;
        mAutos = new Auto[this.PISO][this.PLAZA];
    }

    public Estacionamiento(String n, String d, String ha, String hc, int N, int M) {
        this.nombre = n;
        this.direccion = d;
        this.hApertura = ha;
        this.hCierre = hc;
        this.PISO = N;
        this.PLAZA = M;
        this.DIMF = 0;
        mAutos = new Auto[this.PISO][this.PLAZA];
    }

    private boolean estaRangoPiso(int N) {
        return ((N >= 1) && (N <= this.PISO));
    }

    private boolean estaRangoPlaza(int N) {
        return ((N >= 1) && (N <= this.PLAZA));
    }

    public void registrarAuto(Auto A, int X, int Y) {
        if ((estaRangoPiso(X)) && (estaRangoPlaza(Y))) {
            if (mAutos[X - 1][Y - 1] == null) {
                mAutos[X - 1][Y - 1] = A;
            } else {
                System.out.println("Espacio ocupado");
            }
        } else {
            System.out.println("El piso o plaza ingresado esta fuera de rango");
        }
    }

    public String encontrarAutoByPatente(int p) {
        String aux = "Auto Inexistente";
        int i = 0, j = 0;
        boolean esta = false;

        while ((i < this.PISO) && (!esta)) {
            while ((j < this.PLAZA) && (!esta)) {
                if ((mAutos[i][j] != null) && (mAutos[i][j].getPatente() == p)) {
                    
                        esta = true;
                        aux = "Piso: " + (i + 1) + " | Plaza: " + (j + 1);
                    
                } else {
                    j++;
                }
            }
            j = 0;
            i++;
        }

        return aux;
    }

    public String toString() {
        String aux = "";

        for (int i = 0; i < this.PISO; i++) {
            for (int j = 0; j < this.PLAZA; j++) {
                aux = aux + "Piso: " + (i + 1) + " Plaza: " + (j + 1) + ": ";
                if (mAutos[i][j] != null) {
                    aux = aux + mAutos[i][j].toString() + "\n";
                } else {
                    aux = aux + "Libre \n";
                }
            }
        }

        return aux;
    }

    public int cantidadEnPlaza(int Y) {
        int total = 0;

        if (estaRangoPlaza(Y)) {
            for (int i = 0; i < this.PISO; i++) {
                if (mAutos[i][Y - 1] != null) {
                    total++;
                }
            }
        } else {
            System.out.println("El numero de plaza esta fuera de rango");
        }

        return total;
    }
}
