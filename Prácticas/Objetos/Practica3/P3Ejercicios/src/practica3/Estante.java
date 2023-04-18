/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author agust
 */
public class Estante {
    private int DIMF = 20;
    private int cantAlmacenados = 0; //es la DIML
    private Libro[] vLibro;
    
    public Estante(){
        this.vLibro = new Libro[DIMF];
    }
    
    public int getCantAlmacenados(){
        return this.cantAlmacenados;
    }
    
    public boolean estaLleno(){
        return this.cantAlmacenados == this.DIMF;
    }
    
    public void agregarLibro(Libro l){
        if(this.cantAlmacenados < DIMF){
            vLibro[this.cantAlmacenados] = l;
            this.cantAlmacenados++;
        }
    }
    
    public Libro buscarLibro(String t){
        Libro aux = null;
        
        for(int i = 0; i < this.cantAlmacenados; i++){
            if(this.vLibro[i].getTitulo().equals(t)){
                aux = this.vLibro[i];
            }
                   
        }
        
        return aux;
    }
}
