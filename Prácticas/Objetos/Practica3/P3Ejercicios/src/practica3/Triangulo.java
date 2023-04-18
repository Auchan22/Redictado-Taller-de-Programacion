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
public class Triangulo {

    private double lado1, lado2, lado3;
    private String cRelleno, cLinea;

    public Triangulo(double l1, double l2, double l3, String cR, String cL) {
        this.lado1 = l1;
        this.lado2 = l2;
        this.lado3 = l3;
        this.cLinea = cL;
        this.cRelleno = cR;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getcRelleno() {
        return cRelleno;
    }

    public void setcRelleno(String cRelleno) {
        this.cRelleno = cRelleno;
    }

    public String getcLinea() {
        return cLinea;
    }

    public void setcLinea(String cLinea) {
        this.cLinea = cLinea;
    }
    
    public double calcularPerimetro(){
        double aux = lado1 + lado2 + lado3;
        return aux;
    }
    
    public double calcularArea(){
        double s = (lado1 + lado2 + lado3)/2;
        double contenidoRaiz = s*(s-lado1)*(s-lado2)*(s-lado3);
        double aux = Math.sqrt(contenidoRaiz);
        return aux;
    }
}
