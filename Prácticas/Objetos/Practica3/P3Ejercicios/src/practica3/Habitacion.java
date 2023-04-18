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
public class Habitacion {
    private int costoNoche;
    private boolean estaOcupada;
    private Cliente c;

    public Habitacion(int costoNoche, boolean estaOcupada) {
        this.costoNoche = costoNoche;
        this.estaOcupada = estaOcupada;
    }


    public int getCostoNoche() {
        return costoNoche;
    }

    public void setCostoNoche(int costoNoche) {
        this.costoNoche = costoNoche;
    }

    public boolean isEstaOcupada() {
        return estaOcupada;
    }

    public void setEstaOcupada(boolean estaOcupada) {
        this.estaOcupada = estaOcupada;
    }

    public Cliente getC() {
        return c;
    }

    public void setC(Cliente c) {
        this.c = c;
    }
    
    public String toString(){
        String aux = new String("");
        aux = "" + this.getCostoNoche();
        if(this.estaOcupada){
            aux = aux + ", ocupada, " + this.getC().toString();
        }else{
            aux = aux + ", libre";
        }
        return aux;
    }
    
}
