/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional;

/**
 *
 * @author agust
 */
public class Alumno {
    private String nombre, instrumento;
    private int edad;
    private double puntaje;
    
    public Alumno(String n, String i, int e){
        this.nombre = n;
        this.instrumento = i;
        this.edad = e;
        this.puntaje = -1;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getInstrumento() {
        return instrumento;
    }

    public void setInstrumento(String instrumento) {
        this.instrumento = instrumento;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }
    
    public String toString(){
        String aux = "Nombre: " + this.getNombre() + " | Edad: "+ this.getEdad() + " | Puntaje: "+ this.getPuntaje() + " | Instrumento: "+ this.getInstrumento();
        return aux;
    }
}
