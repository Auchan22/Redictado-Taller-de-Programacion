/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial3;

/**
 *
 * @author agust
 */
public class Paciente {
    private String nombre;
    private boolean obraSocial;
    private int costo;
    
    public Paciente(String n, boolean o, int c){
        this.nombre = n;
        this.obraSocial = o;
        this.costo = c;
    }

    public String getNombre() {
        return nombre;
    }

    public boolean isObraSocial() {
        return obraSocial;
    }

    public int getCosto() {
        return costo;
    }
    
    
}
