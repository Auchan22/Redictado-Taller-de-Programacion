/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional;

/**
 *
 * @author agust
 */
public class Genero {
    private int DIMF;
    private int DIML = 0;
    private Alumno[] vAlumnos;
    
    public Genero(int N){
        this.DIMF = N;
        //this.inicializarVector();
        this.vAlumnos = new Alumno[DIMF];
    }
    
    /*private void inicializarVector(){
        for(int i = 0; i < this.getDIMF(); i++){
            this.vAlumnos[i] = null;
        }
    }*/
    
    public int getDIMF(){
        return this.DIMF;
    }
    
    public int getDIML(){
        return this.DIML;
    }
    
    public void inscribirAlumno(Alumno A){
        if(this.getDIML() < this.getDIMF()){
            vAlumnos[this.DIML] = A;
            this.DIML++;
        }else{
            System.out.println("El genero se encuentra lleno");
        }
    }
    
    public Alumno getMaxAlumno(){
        Alumno maxA = null;
        double maxP = -1;
        for(int i = 0; i < this.getDIML(); i++){
            if(vAlumnos[i].getPuntaje() >= maxP){
                maxP= vAlumnos[i].getPuntaje();
                maxA = vAlumnos[i];
            }
        }
        
        return maxA;
    }
    
    public Alumno buscarAlumnoPorNombre(String n){
        Alumno a = null;
        for(int i = 0; i < this.DIML; i++){
            if(vAlumnos[i].getNombre().equals(n)){
                a = vAlumnos[i];
            }
        }
        
        return a;
    }
    
    public String toString(){
        String aux = "";
        
        for(int i = 0; i < this.DIML; i++){
            aux = aux + "Representacion del alumno "+ (i+1) + ": " + vAlumnos[i].toString() + " - ";
        }
        
        return aux;
    }
}
