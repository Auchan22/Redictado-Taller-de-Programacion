/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio5;

import ejercicio4.Cuadrado;
import ejercicio4.Rectangulo;

/**
 *
 * @author agust
 */
public class main {

    public static void main(String[] args) {
        VisorFigurasModificado visor = new VisorFigurasModificado();

        Cuadrado c1 = new Cuadrado(10, "Violeta", "Rosa");
        Rectangulo r = new Rectangulo(20, 10, "Azul", "Celeste");
        Cuadrado c2 = new Cuadrado(30, "Rojo", "Naranja");
        visor.mostrar();
        visor.guardar(c1);
        visor.guardar(c2);
        visor.guardar(r);
        visor.mostrar();
    }

}
