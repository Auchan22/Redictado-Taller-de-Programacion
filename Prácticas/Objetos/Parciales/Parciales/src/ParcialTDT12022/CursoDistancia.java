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
public class CursoDistancia extends Curso {
    private String linkSala;
    
    public CursoDistancia(int a, int M, String l){
        super(a, M);
        this.linkSala = l;
    }

    public String getLinkSala() {
        return linkSala;
    }
    
    public boolean puedeRendir(Alumno A){
        boolean aux = false;
        System.out.println(A.getNombre() + " | "+ A.getAsistencias() + " | "+A.getCantAutoevaluaciones());
        if((A.getCantAutoevaluaciones() >= 3) && (A.getAsistencias() >= 1)){
            aux = true;
        }
        
        return aux;
    }
}
