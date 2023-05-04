/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialLibros;

/**
 *
 * @author agust
 */
public class LibroImpreso extends Libro{
    private boolean esTapaDura;

    public LibroImpreso(boolean esTapaDura, String titulo, int precioBase) {
        super(titulo, precioBase);
        this.esTapaDura = esTapaDura;
    }

    public boolean isTapaDura() {
        return esTapaDura;
    }
    
    
}
