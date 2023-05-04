/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialTDT12022;

/**
 *
 * @author agust
 */
public abstract class Curso {
    private int añoCursada;
    private Alumno[] vAlumnos;
    private int DIMF, DIML;
    
    public Curso(int a, int M){
        this.añoCursada = a;
        this.DIMF = M;
        this.vAlumnos = new Alumno[M];
        this.DIML = 0;
    }

    public int getAñoCursada() {
        return añoCursada;
    }

    public void setAñoCursada(int añoCursada) {
        this.añoCursada = añoCursada;
    }

    public int getDIMF() {
        return DIMF;
    }

    public void setDIMF(int DIMF) {
        this.DIMF = DIMF;
    }

    public int getDIML() {
        return DIML;
    }

    public void setDIML(int DIML) {
        this.DIML = DIML;
    }
    
    public boolean agregarAlumno(Alumno A){
        boolean aux = false;
        
        if(DIML < DIMF){
            vAlumnos[DIML] = A;
            DIML++;
            aux = true;
        }
        
        return aux;
    }
    
    private Alumno encontrarAlumnoByDNI(int DNI){
        Alumno aux = null;
        boolean esta = false;
        int i = 0;
        
        while((i < DIML) && (!esta)){
            if(vAlumnos[i].getDNI() == DNI){
                aux = vAlumnos[i];
                esta = true;
            }else{
                i++;
            }
        }
        
        return aux;
    }
    
    public void incrementarAsistencia(int DNI){
        Alumno aux = encontrarAlumnoByDNI(DNI);
        if(aux != null){
            aux.setAsistencias(aux.getAsistencias() + 1);
            //System.out.println(aux.toString());
        }else{
            System.out.println("No se encontro el alumno con ese DNI");
        }
    }
    
    public void aprobarAutoevaluacion(int DNI){
        Alumno aux = encontrarAlumnoByDNI(DNI);
        if(aux != null){
            aux.setCantAutoevaluaciones(aux.getCantAutoevaluaciones()+ 1);
            //System.out.println(aux.toString());
        }else{
            System.out.println("No se encontro el alumno con ese DNI");
        }
    }
    
    public abstract boolean puedeRendir(Alumno A);
    
    public int cantidadDeAlumnosQuePuedenRendir(){
        int total = 0;
        
        for(int i = 0; i < DIML; i++){
            if(this.puedeRendir(vAlumnos[i])){
                total++;
            }
        }
        
        return total;
    }
}
