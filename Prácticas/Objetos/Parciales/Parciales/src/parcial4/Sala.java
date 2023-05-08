/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author agust
 */
public class Sala {
    private int DIMF, DIML;
    private Alumno[] vAlumnos;
    
    public Sala(int M){
        this.DIMF = M;
        this.DIML = 0;
        this.vAlumnos = new Alumno[this.DIMF];
    }
    
    public void agregarAlumno(Alumno A){
        vAlumnos[DIML] = A;
        DIML++;
    }
    
    public void asignarTemas(){
        GeneradorAleatorio.iniciar();
        for(int i = 0; i < DIML; i++){
            int t = GeneradorAleatorio.generarInt(DIMF) + 1;
            vAlumnos[i].setTema(t);
            System.out.println(vAlumnos[i].getNombre() + " | "+vAlumnos[i].getNroTema());
        }
    }
    
    public String getAlumnosByTema(int T){
        String aux = "";
        
        for(int i = 0; i < DIML; i++){
            if(vAlumnos[i].getNroTema() == T){
                aux = aux +" -> " +vAlumnos[i].toString() + "\n";
            }
        }
        
        return aux;
    }
}
