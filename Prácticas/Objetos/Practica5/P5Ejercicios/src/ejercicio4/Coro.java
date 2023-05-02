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
public abstract class Coro {
    private String nombre;
    private Director director;
    
    public Coro(String n, Director d){
        this.nombre = n;
        this.director = d;
    }

    public String getNombre() {
        return nombre;
    }

    public Director getDirector() {
        return director;
    }
    
    public abstract void agregarCorista(Corista C);
    
    public abstract boolean estaLleno();
    
    public abstract boolean estaBienFormado();
}
