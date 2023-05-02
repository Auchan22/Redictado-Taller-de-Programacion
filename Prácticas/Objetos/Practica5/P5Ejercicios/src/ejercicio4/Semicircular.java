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
public class Semicircular extends Coro {
    private Corista[] vCoristas;
    private int DIMF, DIML = 0;
    
    public Semicircular(String n, Director d, int dimf){
        super(n, d);
        this.DIMF = dimf;
        this.vCoristas = new Corista[this.DIMF];
    }

    public int getDIMF() {
        return DIMF;
    }

    public int getDIML() {
        return DIML;
    }
    
    public void agregarCorista(Corista C){
        if(this.DIML < this.DIMF){
            vCoristas[this.DIML] = C;
            this.DIML++;
        }else{
            System.out.println("Vector de Coristas lleno");
        }
    }
    
    public boolean estaLleno(){
        return this.DIML == this.DIMF;
    }
    
    public boolean estaBienFormado(){
        boolean aux = true;
        int i = 0;
        
        while((i<this.DIML) && (aux)){
            aux = vCoristas[i].getTonoFundamental() > vCoristas[i+1].getTonoFundamental();
            i++;
        }
        return aux;
    }
}
