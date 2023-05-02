/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author agust
 */
public class index {

    public static void main(String[] args) {
        Estanteria E = new Estanteria(5, 3);

        Libro libro1 = new Libro("El Quijote", "Miguel de Cervantes", 1.23);
        Libro libro2 = new Libro("El Aleph", "Jorge Luis Borges", 0.76);
        Libro libro3 = new Libro("1984", "George Orwell", 0.89);
        Libro libro4 = new Libro("Harry Potter y la piedra filosofal", "J.K. Rowling", 0.98);
        Libro libro5 = new Libro("Ficciones", "Jorge Luis Borges", 0.89);
        Libro libro6 = new Libro("La Odisea", "Homero", 1.12);
        Libro libro7 = new Libro("El laberinto de la soledad", "Octavio Paz", 0.62);
        
        E.almacenarLibro(libro1);
        E.almacenarLibro(libro2);
        E.almacenarLibro(libro3);
        E.almacenarLibro(libro4);
        E.almacenarLibro(libro5);
        E.almacenarLibro(libro6);
        E.almacenarLibro(libro7);
        
        Libro L = E.sacarLibro(2, 2);
        if(L == null){
            System.out.println("No se encontro el libro en esa posicion");
        }else{
            System.out.println(L.toString());
        }
        
        System.out.println("Cantidad de libros de Borges: "+ E.calcular("Jorge Luis Borges"));

    }
}
