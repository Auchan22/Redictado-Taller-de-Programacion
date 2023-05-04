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
public class LibroElectronico extends Libro {
    private String formato;
    private int tamaño;

    public LibroElectronico(String formato, int tamaño, String titulo, int precioBase) {
        super(titulo, precioBase);
        this.formato = formato;
        this.tamaño = tamaño;
    }

    public String getFormato() {
        return formato;
    }

    public int getTamaño() {
        return tamaño;
    }
    
    public double obtenerPrecioFinal(){
        double aux = super.obtenerPrecioFinal() + (2.5 * tamaño);
        
        return aux;
    }
}
