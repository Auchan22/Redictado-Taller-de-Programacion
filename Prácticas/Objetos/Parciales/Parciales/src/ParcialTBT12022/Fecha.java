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
public class Fecha {

    private int DIMF, DIML = 0;
    private Goleador[] vGoleadores;

    public Fecha(int M) {
        this.DIMF = M;
        this.vGoleadores = new Goleador[this.DIMF];
    }

    public int getDIMF() {
        return DIMF;
    }

    public int getDIML() {
        return DIML;
    }

    public void agregarGoleador(Goleador G) {
        if (this.DIML < this.DIMF) {
            vGoleadores[this.DIML] = G;
            this.DIML++;
        }else{
            System.out.println("El vector de goleadores esta lleno");
        }
    }
    
    public Goleador getGoleadorMin(){
        Goleador aux = null;
        int minGoles = 100;
        
        for(int i = 0; i < this.DIML; i++){
            if(vGoleadores[i].getCantGoles() < minGoles){
                minGoles = vGoleadores[i].getCantGoles();
                aux = vGoleadores[i];
            }
        }
        
        return aux;
    }
    
    public String toString(){
        String aux = "";
        
        for(int i = 0; i < this.DIML; i++){
            aux = aux + "-> "+ vGoleadores[i].toString() + "\n";
        }
        
        return aux;
    }
}
