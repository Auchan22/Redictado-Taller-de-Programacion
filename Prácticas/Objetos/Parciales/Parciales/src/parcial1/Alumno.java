/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author agust
 */
public class Alumno {
    private String nombre;
    private int DNI, nroTema;
    
    public Alumno( String n, int DNI){
        this.DNI = DNI;
        this.nombre = n;
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

    public void setNroTema(int nroTema) {
        this.nroTema = nroTema;
    }
    
    public String toString(){
        String aux = "Nombre: "+ this.nombre + " | DNI: "+ this.DNI+ " | NroTema: "+ this.nroTema;
        
        return aux;
    }
}
