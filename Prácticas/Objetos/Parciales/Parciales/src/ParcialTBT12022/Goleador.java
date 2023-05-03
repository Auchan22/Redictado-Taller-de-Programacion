/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialTBT12022;

/**
 *
 * @author agust
 */
public class Goleador {
    private String nombre, nombreEquipo;
    private int cantGoles;

    public Goleador(String nombre, String nombreEquipo, int cantGoles) {
        this.nombre = nombre;
        this.nombreEquipo = nombreEquipo;
        this.cantGoles = cantGoles;
    }

    public String getNombre() {
        return nombre;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public int getCantGoles() {
        return cantGoles;
    }
    
    public String toString(){
        String aux = "Nombre: "+ this.nombre + " | Equipo: "+ this.nombreEquipo + " | Cantidad de Goles: "+ this.cantGoles;
        
        return aux;
    }
}
