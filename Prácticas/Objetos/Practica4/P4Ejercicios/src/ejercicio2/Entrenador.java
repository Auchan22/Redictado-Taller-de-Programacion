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
public class Entrenador extends Empleado {
    private int cantCampeonatosGanados;

    public Entrenador(String nombre, double sueldo, int antiguedad, int c) {
        super(nombre, sueldo, antiguedad);
        this.cantCampeonatosGanados = c;
    }

    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }

    @Override
    public double calcularEfectividad() {
        int aux = this.cantCampeonatosGanados/super.getAntiguedad();
        //System.out.println(this.cantCampeonatosGanados+ ""+ super.getAntiguedad());
        return aux;
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double aux = super.calcularSueldoACobrar();
        if((this.cantCampeonatosGanados >= 1) && (this.cantCampeonatosGanados <= 4)){
            aux = aux + 5000;
        }else if((this.cantCampeonatosGanados >= 5) && (this.cantCampeonatosGanados <= 10)){
            aux = aux + 30000;
        }else if(this.cantCampeonatosGanados > 10){
            aux = aux + 50000;
        }
        
        return aux;
    }
    
}
