/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialTBT12022;

/**
 *
 * @author agust
 */
public class Torneo {
    private String nombre;
    private Fecha[] vFechas;
    private int DIMF;
    
    public Torneo(String n, int N, int M){
        this.nombre = n;
        this.DIMF = N;
        this.vFechas = new Fecha[this.DIMF+1];
        this.inicializarVector(M);
    }
    
    private void inicializarVector(int  M){
        for(int i = 1; i <= this.DIMF; i++){
            this.vFechas[i] = new Fecha(M);
        }
    }

    public String getNombre() {
        return nombre;
    }

    public int getDIMF() {
        return DIMF;
    }
    
    public void agregarGoleador(int X, Goleador G){
        vFechas[X].agregarGoleador(G);
    }
    
    public Goleador obtenerGoleadorMin(int X){
        Goleador aux = null;
        aux = vFechas[X].getGoleadorMin();
                
        return aux;
    }
    
    public int obtenerCantTotalGoleadores(){
        int total = 0;
        
        for(int i = 1; i <= this.DIMF; i++){
            total = total + vFechas[i].getDIML();
        }
        
        return total;
    }
    
    public String toString(){
        String aux = "Torneo 2022: "+this.nombre + "\n";
        
        for(int i = 1; i <= this.DIMF; i++){
            aux = aux + "Fecha #"+i+" | Cantidad de Goleadores: "+vFechas[i].getDIML() + " | Goleadores: \n " + vFechas[i].toString();
        }
        
        return aux;
    }
    
}
