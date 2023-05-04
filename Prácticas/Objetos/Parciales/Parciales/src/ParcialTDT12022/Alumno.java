/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialTDT12022;

/**
 *
 * @author agust
 */
public class Alumno {
    private int DNI, asistencias, cantAutoevaluaciones;
    private String nombre;

    public Alumno(int DNI, String nombre) {
        this.DNI = DNI;
        this.asistencias = 0;
        this.cantAutoevaluaciones = 0;
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public int getAsistencias() {
        return asistencias;
    }

    public int getCantAutoevaluaciones() {
        return cantAutoevaluaciones;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void setAsistencias(int a){
        this.asistencias = a;
    }

    public void setCantAutoevaluaciones(int cantAutoevaluaciones) {
        this.cantAutoevaluaciones = cantAutoevaluaciones;
    }
    
}
