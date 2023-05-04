/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialTCT22022;

/**
 *
 * @author agust
 */
public class Butaca {
    private String descriptor;
    private double precio;
    private boolean ocupada; //True ocupado, false desocupado

    public Butaca(String descriptor, double precio) {
        this.descriptor = descriptor;
        this.precio = precio;
        this.ocupada = false;
    }

    public String getDescriptor() {
        return descriptor;
    }

    public double getPrecio() {
        return precio;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }
    
    
    public String toString(){
        String aux = "Descriptor: "+ descriptor + " | Precio: "+ precio + " | Estado: ";
        
        if(ocupada){
            aux = aux + "ocupada";
        }else{
            aux = aux + "desocupada";
        }
        
        return aux;
    }
    
}
