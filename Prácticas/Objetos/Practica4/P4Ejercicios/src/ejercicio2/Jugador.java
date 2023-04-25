/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

/**
 *
 * @author agust
 */
public class Jugador extends Empleado {
    private int cantPartidos, cantGoles;

    public Jugador(String nombre, double sueldo, int antiguedad, int cantPartidos, int cantGoles) {
        super(nombre, sueldo, antiguedad);
        this.cantPartidos = cantPartidos;
        this.cantGoles = cantGoles;
    }
    
    public int getCantPartidos() {
        return cantPartidos;
    }

    public void setCantPartidos(int cantPartidos) {
        this.cantPartidos = cantPartidos;
    }

    public int getCantGoles() {
        return cantGoles;
    }

    public void setCantGoles(int cantGoles) {
        this.cantGoles = cantGoles;
    }
    
        @Override
    public double calcularEfectividad() {
        double aux = this.cantGoles / this.cantPartidos;
        return aux;
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double aux = super.calcularSueldoACobrar();
        if(this.calcularEfectividad() > 0.5){
            aux = aux + super.getSueldo();
        }
        
        return aux;
    }
    

}
