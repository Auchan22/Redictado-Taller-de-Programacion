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
public class Director {
    private String nombre;
    private int dni, edad, antiguedad;

    public Director(String nombre, int dni, int edad, int antiguedad) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.antiguedad = antiguedad;
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

    public int getAntiguedad() {
        return antiguedad;
    }

}
