/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author agust
 */
public class Libro {

    private String titulo, autor;
    private double peso;

    public Libro(String t, String a, double p) {
        this.titulo = t;
        this.autor = a;
        this.peso = p;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getAutor() {
        return autor;
    }

    public double getPeso() {
        return peso;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setAutor(String nombreAutor) {
        this.autor = nombreAutor;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }
    
    public String toString(){
        String aux = "Titulo: "+ this.titulo + " |  Nombre Autor: "+ this.autor + " | Peso: "+this.peso;
        return aux;
    }
}
