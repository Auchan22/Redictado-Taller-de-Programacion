/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author agust
 */
public class Fecha {
    private int DIMF;
    private Sala[] vSalas;
    
    public Fecha(int N, int M){
        this.DIMF = N;
        this.vSalas = new Sala[this.DIMF];
        this.inicializarVector(M);
    }
    
    private void inicializarVector(int M){
        for(int i = 0; i < DIMF; i++){
            vSalas[i] = new Sala(M);
        }
    }
    
    public void agregarAlumno(int X, Alumno A){
        vSalas[X-1].agregarAlumno(A);
    }
    
    public void asignarTema(){
        for(int i = 0; i < DIMF; i++){
            vSalas[i].asignarTemas();
        }
    }
    
    public String toString(int T){
        String aux = "";
        
        for(int i = 0; i < DIMF; i++){
            aux = aux + "Sala: "+(i+1)+ " | Alumnos que rindieron tema T: "+ vSalas[i].getAlumnosByTema(T) + "\n";
        }
        
        return aux;
        
    }
}
