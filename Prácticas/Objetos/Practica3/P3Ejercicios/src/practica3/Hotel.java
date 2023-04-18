/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author agust
 */
public class Hotel {

    private int DIMF;
    private Habitacion[] vHabitacion;

    public Hotel(int DIMF) {
        this.DIMF = DIMF;
        vHabitacion = new Habitacion[this.DIMF];
        this.inicializarVector(vHabitacion);
    }

    private void inicializarVector(Habitacion[] v) {
        GeneradorAleatorio.iniciar();
        for (int i = 0; i < this.DIMF; i++) {
            int costo = GeneradorAleatorio.generarInt(6001) + 2000;
            v[i] = new Habitacion(costo, false);
        }
    }

    public void ingresarCliente(Cliente c, int Hnumber) {
        if (!vHabitacion[Hnumber - 1].isEstaOcupada()) {
            vHabitacion[Hnumber - 1].setEstaOcupada(true);
            vHabitacion[Hnumber - 1].setC(c);
            System.out.println("Habitacion asignada correctamente al cliente: " + c.getNombre());
        } else {
            System.out.println("Habitacion ocupada");
        }
    }

    public void aumentarPrecio(int m) {
        for (int i = 0; i < this.DIMF; i++) {
            vHabitacion[i].setCostoNoche(vHabitacion[i].getCostoNoche() + m);
        }
    }

    public String toString() {
        String aux = new String("");
        for (int i = 0; i < this.DIMF; i++) {
            aux = aux + "Habitacion " + (i + 1) + ": ";
                aux = aux + vHabitacion[i].toString() + "\n";
        }

        return aux;
    }

}
