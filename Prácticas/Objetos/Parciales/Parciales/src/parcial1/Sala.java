/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author agust
 */
public class Sala {
    private Alumno[] vAlumno;
    private int DIMF, DIML = 0;
    
    public Sala(int M){
        
        this.DIMF = M;
        this.vAlumno = new Alumno[this.DIMF];
    }

    public int getDIML() {
        return DIML;
    }
    
    public void agregarAlumno(Alumno A){
        if(this.DIML < this.DIMF){
            vAlumno[this.DIML] = A;
            this.DIML++;
        }
    }
    
    public void asignarTema(){
        GeneradorAleatorio.iniciar();
        for(int i = 0; i < this.DIML; i++){
            vAlumno[i].setNroTema(GeneradorAleatorio.generarInt(DIMF) + 1);
            System.out.println(vAlumno[i].toString());
        }
    }
    
    public String toString(int T){
        String aux = "";
        for(int i = 0; i < this.DIML; i++){
            if(vAlumno[i].getNroTema() == T){
                aux = aux + vAlumno[i].toString() + "\n";
            }
        }
        
        return aux;
    }
}
