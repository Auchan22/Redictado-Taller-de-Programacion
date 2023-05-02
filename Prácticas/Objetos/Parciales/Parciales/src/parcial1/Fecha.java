/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author agust
 */
public class Fecha {
    private Sala[] vSalas;
    private int DIMF;
    private int maxAlumno;
    
    public Fecha(int N, int M){
        this.DIMF = N;
        this.maxAlumno = M;
        this.vSalas = new Sala[this.DIMF];
        this.inicializarVector(M);
    }
    
    private void inicializarVector(int M){
        for(int i = 0; i < this.DIMF; i++){
            vSalas[i] = new Sala(M);
        }
    }
    
    public void agregarAlumnoEnSala(int X, Alumno A){
        if((X >= 0) && (X < this.DIMF)){
            vSalas[X-1].agregarAlumno(A);
            //System.out.println("Se agrego al alumno: "+A.toString()+" en la sala: "+X);
        }
    }
    
    public void asignarTema(){
        for(int i = 0; i < this.DIMF; i++){
            vSalas[i].asignarTema();
        }
    }
    
    public String toString(int T){
        String aux = "";
        for(int i = 0; i < this.DIMF; i++){
            aux =aux +  vSalas[i].toString(T);
        }
        return aux;
    }
}
