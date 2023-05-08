/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author agust
 */
public class Alumno {
    private String nombre;
    private int DNI, nroTema;
    
    public Alumno(String n, int d){
        this.nombre = n;
        this.DNI = d;
        this.nroTema = -1;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public int getNroTema() {
        return nroTema;
    }
    
    public void setTema(int t){
        this.nroTema = t;
    }
    
    public String toString(){
        String aux = "Nombre: "+ this.nombre + " | DNI: "+ this.DNI;
        
        return aux;
    }
}
