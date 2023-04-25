/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

/**
 *
 * @author agust
 */
public class ejercicio2 {
    public static void main(String[] args){
        Jugador j = new Jugador( "Pepito", 120000, 5, 10, 8);
        Entrenador e = new Entrenador("Pep Guardiola", 300000, 10, 3);
        
        System.out.println(j.toString());
        System.out.println(e.toString());
    }
}
