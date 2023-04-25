/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1;

/**
 *
 * @author agust
 */
public class Circulo extends Figura {
    private double radio;
    
    public Circulo(double radio, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
        this.radio = radio;
    }
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularPerimetro(){
        return 2*Math.PI * this.getRadio();
    }
    
    @Override
    public double calcularArea(){
        return Math.PI * Math.pow(this.getRadio(), 2);
    }
    
    /**
     *
     * @return
     */
    @Override
    public String toString(){
        String aux;
        aux = super.toString();
        
        return aux;
    }
}
