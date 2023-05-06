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
public class Pareja {

    private Participante p1, p2;
    private String estilo;

    public Pareja(Participante p1, Participante p2, String e) {
        this.p1 = p1;
        this.p2 = p2;
        this.estilo = e;
    }

    public String getEstilo() {
        return estilo;
    }

    public int obtenerDiferenciaEdad() {
        int aux = Math.abs(p1.getEdad() - p2.getEdad());

        return aux;
    }
    
    public String toString(){
        String aux = "Participante 1: "+p1.getNombre() + " | Participante 2: "+p2.getNombre();
        
        return aux;
    }
}
