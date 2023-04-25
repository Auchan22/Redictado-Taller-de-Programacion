/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio5;

import ejercicio1.Figura;

/**
 *
 * @author agust
 */
public class VisorFigurasModificado {

    private int guardadas;
    private int capacidadMaxima = 5;
    private Figura[] vector;

    public VisorFigurasModificado() {
        this.vector = new Figura[capacidadMaxima];
        this.guardadas = 0;
    }

    public void guardar(Figura f) {
        if (this.quedaEspacio()) {
            vector[guardadas] = f;
            guardadas++;
        }
    }

    public boolean quedaEspacio() {
        return guardadas < capacidadMaxima;
    }

    public void mostrar() {
        if (guardadas > 0) {

            for (int i = 0; i < guardadas; i++) {
                System.out.println(vector[i].toString());
            }
        } else {
            System.out.println("No hay ninguna figura guardada");
        }
    }

    public int getGuardadas() {
        return guardadas;
    }
}
