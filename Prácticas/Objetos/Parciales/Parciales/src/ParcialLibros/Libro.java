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
public abstract class Libro {
    private String titulo;
    private double precioBase;
    private String[] vAutores;
    private int DIMF = 8, DIML;

    public Libro(String titulo, double precioBase) {
        this.titulo = titulo;
        this.precioBase = precioBase;
        this.vAutores = new String[DIMF];
        this.DIML = 0;
    }

    public String getTitulo() {
        return titulo;
    }

    public double getPrecioBase() {
        return precioBase;
    }

    public int getDIML() {
        return DIML;
    }
    
    public void agregarAutor(String n){
        if(DIML < DIMF){
            vAutores[DIML] = n;
            DIML++;
        }else{
            System.out.println("Vector de autores lleno");
        }
    }
    
    public double obtenerPrecioFinal(){
        double iva = (precioBase * 21) / 100;
        double aux = precioBase + iva;
        
        return aux;
    }
    
    public String toString(){
        String aux = "Titulo: "+titulo + " | Precio Final: "+this.obtenerPrecioFinal() + " | Nombre del primer autor: "+vAutores[0];
        
        return aux;
    }
    
    
}
