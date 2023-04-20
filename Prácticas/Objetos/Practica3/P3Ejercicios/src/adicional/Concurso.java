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
public class Concurso {

    private int DIMF = 5;
    private Genero[] vGenero;

    public Concurso() {
        this.vGenero = new Genero[this.DIMF];
        this.inicializarVector();
    }
    
    private void inicializarVector(){
        for(int i = 0; i < this.DIMF; i++){
            this.vGenero[i] = new Genero(20);
        }
    }
    
    public int getDIMF(){
        return this.DIMF;
    }
    
        //Inciso C
    public Alumno getMayorPuntaje(){
        double maxP = -1;
        Alumno maxA = null;
        for(int i = 0; i < this.getDIMF(); i++){
            Genero gActual = vGenero[i];
            Alumno maxAlumGenero = gActual.getMaxAlumno();
            if((maxAlumGenero != null) && (maxAlumGenero.getPuntaje() >= maxP)){
                maxP = maxAlumGenero.getPuntaje();
                maxA = maxAlumGenero;
            }
        }
        
        return maxA;
    }
    
    //Inciso A
    public void inscribirAlumno(Alumno A, int g){
        if((g >=1) && (g <= 5)){
            vGenero[g-1].inscribirAlumno(A);
        }else{
            System.out.println("El genero esta fuera de rango");
        }
    }
    
    //Inciso B
    public void actualizarPuntajePorNombre(int g, String n, double p){
        if((g >=1) && (g <= 5)){
            Alumno aBus = vGenero[g-1].buscarAlumnoPorNombre(n);
            if(aBus != null){
                aBus.setPuntaje(p);
                System.out.println("Alumno actualizado!");
            }else{
                System.out.println("No se encontro al alumno de nombre: "+ n);
            }
        }else{
            System.out.println("El genero esta fuera de rango");
        }
    }
    
    //Inciso D
    public String toString(){
        String aux = "";
        for(int i = 0; i < this.DIMF; i++){
            aux = aux + "Genero "+ (i+1)+" - Total Inscriptos: "+vGenero[i].getDIML()+" - "+vGenero[i].toString() + "\n";
        }
        
        aux = aux + "\n" + "Alumno de mayor puntaje es: "+ this.getMayorPuntaje().toString();
        
        return aux;
    }
    
}
