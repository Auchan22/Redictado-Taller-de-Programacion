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
public class Corista {

    private String nombre;
    private int dni, edad, tonoFundamental;

    public Corista(String nombre, int dni, int edad, int tonoFundamental) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.tonoFundamental = tonoFundamental;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDni() {
        return dni;
    }

    public int getEdad() {
        return edad;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

}
