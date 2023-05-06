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
public class index {
    public static void main(String[] args){
        Concurso C = new Concurso(3);
        
        Participante p1 = new Participante(12345678, 20, "Miriam");
        Participante p2 = new Participante(12345679, 32, "Juan");
        Participante p3 = new Participante(12345670, 10, "Leon");
        Participante p4 = new Participante(12345671, 40, "Jose");
        
        Pareja pa1 = new Pareja(p1, p2, "Tango");
        Pareja pa2 = new Pareja(p3, p4, "Folklore");
        
        C.agregarPareja(pa1);
        C.agregarPareja(pa2);
        
        Pareja aux = C.obtenerParejaMaxDiferencia();
        
        if(aux != null){
            System.out.println("Pareja con mayor diferencia de edad: " + aux.obtenerDiferenciaEdad()+ " -> "+aux.toString());
        }else{
            System.out.println("No se encontro pareja :(");
        }
    }
}
