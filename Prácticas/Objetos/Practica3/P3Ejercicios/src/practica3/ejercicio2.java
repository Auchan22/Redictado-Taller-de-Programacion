/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author agust
 */
public class ejercicio2 {

    public static void main(String[] args){
        Autor autor1 = new Autor();
        autor1.setNombre("Herbert Schildt");
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 autor1, "978-0071809252", 21.72);
        
        Autor autor2 = new Autor();
        autor2.setNombre("John Horton");
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               autor2, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        
        System.out.println(libro2.getPrimerAutor().toString());
        Libro libro3= new Libro(); 
    }
    
}
