/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

/**
 *
 * @author agust
 */
public class Hileras extends Coro {

    private int FILA, COLUMNA;
    private int actualFila = 0, actualColumna = 0;
    private Corista[][] mCoristas;
    private int DIML = 0;

    public Hileras(String n, Director d, int X) {
        super(n, d);
        this.FILA = X;
        this.COLUMNA = X;
        this.mCoristas = new Corista[X][X];
    }

    public int getFILA() {
        return FILA;
    }

    public int getCOLUMNA() {
        return COLUMNA;
    }

    public void agregarCorista(Corista C) {
        if (!this.estaLleno()) {
            if (actualColumna < this.COLUMNA) {
                mCoristas[actualFila][actualColumna] = C;
                actualColumna++;
                DIML++;
            } else {
                actualFila++;
                actualColumna = 0;
                mCoristas[actualFila][actualColumna] = C;
                DIML++;
            }
        } else {
            System.out.println("Matriz de Coristas lleno");
        }
    }

    public boolean estaLleno() {
        return this.DIML == (this.FILA * this.COLUMNA);
    }

    public boolean estaBienFormado() {
        int tonoPrimero;
        boolean mismoTono = true;
        boolean mayorToMenor = false;
        int j = 0;
        int i = 1;

        while ((j < getCOLUMNA()) && (mismoTono)) {
            tonoPrimero = mCoristas[i - 1][j].getTonoFundamental();
            while ((i < getFILA()) && (mismoTono)) {
                mismoTono = mCoristas[i][j].getTonoFundamental() == tonoPrimero;
            }
        }

        for (j = 0; j < (getCOLUMNA() - 1); j++) {
            mayorToMenor = mCoristas[0][j].getTonoFundamental() > mCoristas[0][j + 1].getTonoFundamental();
        }

        boolean aux = mismoTono && mayorToMenor;
        return aux;
    }
}
