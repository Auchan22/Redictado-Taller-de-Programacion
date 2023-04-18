/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author agust
 */
public class ejercicio3 {

    public static Libro leerLibro() {
        String[] vTitulos = new String[4];
        String[] vAutores = new String[4];

        vTitulos[0] = "Mujercitas"; //Se puede cambiar este valor por otro titulo, para testear
        vTitulos[1] = "El Principito";
        vTitulos[2] = "El hombre gris";
        vTitulos[3] = "Martin Fierro";

        vAutores[0] = "Miguel";
        vAutores[1] = "Juan";
        vAutores[2] = "Pepe";
        vAutores[3] = "Raul";

        Autor autor = new Autor();
        autor.setNombre(vAutores[GeneradorAleatorio.generarInt(4)]);
        Libro l = new Libro(vTitulos[GeneradorAleatorio.generarInt(4)],
                "Mcgraw-Hill", (2000 + GeneradorAleatorio.generarInt(24)),
                autor, "978-0071809252", 21.72);

        return l;

    }

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        System.out.println(" ");
        System.out.println("Creando estante...");

        Estante e = new Estante();

        for (int i = 0; i < GeneradorAleatorio.generarInt(21); i++) {
            Libro libro = leerLibro();
            System.out.println(libro.toString());
            e.agregarLibro(libro);
        }

        Libro findBook = e.buscarLibro("Mujercitas");
        if ( findBook != null) {
            System.out.println("Autor del libro Mujercitas: " + findBook.getPrimerAutor().getNombre());
        } else {
            System.out.println("No se encontro el libro Mujercitas");
        }

    }
}
