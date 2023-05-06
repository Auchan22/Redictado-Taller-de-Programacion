/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialJava2021;

/**
 *
 * @author agust
 */
public class Concurso {
    private Pareja[] vParejas;
    private int DIML, DIMF;
    
    public Concurso(int N){
        this.DIMF = N;
        this.DIML = 0;
        this.vParejas = new Pareja[this.DIMF];
    }

    public int getDIML() {
        return DIML;
    }

    public int getDIMF() {
        return DIMF;
    }
    
    public void agregarPareja(Pareja p){
        if(DIML < DIMF){
            vParejas[DIML] = p;
            DIML++;
        }else{
            System.out.println("Vector de parejas lleno");
        }
    }
    
    public Pareja obtenerParejaMaxDiferencia(){
        Pareja aux = null;
        int maxDif = -1;
        
        for(int i = 0; i < DIML; i++){
            if(vParejas[i].obtenerDiferenciaEdad() > maxDif){
                aux = vParejas[i];
                maxDif = vParejas[i].obtenerDiferenciaEdad();
            }
        }
        
        return aux;
    }
}
