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
public class CursoPresencial extends Curso {
    private int NroAula;
    
    public CursoPresencial(int a, int M, int n){
        super(a, M);
        this.NroAula = n;
    }

    public int getNroAula() {
        return NroAula;
    }
    
    public boolean puedeRendir(Alumno A){
        boolean aux = false;
        
        if(A.getAsistencias() >= 3){
            aux = true;
        }
        
        return aux;
    }
}
