/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional;

import PaqueteLectura.Lector;

//Se podria implementar el mismo programa, pero con una matriz, con los generos como filas y los alumnos como columnas
/**
 *
 * @author agust
 */
public class adicional {

    public static Alumno leerAlumno() {
        String n, i;
        int e;
        System.out.println(" ");
        System.out.print(" -> Ingrese Nombre del alumno: ");
        n = Lector.leerString();
        System.out.print(" -> Ingrese Instrumento del alumno: ");
        i = Lector.leerString();
        System.out.print(" -> Ingrese Edad del alumno: ");
        e = Lector.leerInt();
        System.out.println(" ");

        return new Alumno(n, i, e);
    }

    public static void cargarConcurso(Concurso C) {
        for (int i = 0; i < 5; i++) {
            System.out.println("---");
            System.out.println("Leyendo alumno: " + (i + 1));
            Alumno a = leerAlumno();
            System.out.print(" -> Genero que desea inscribirse el alumno: ");
            int g = Lector.leerInt();
            C.inscribirAlumno(a, g);
            System.out.println("---");
        }
    }

    public static void main(String[] args) {
        Concurso C = new Concurso();

        cargarConcurso(C);
        for (int i = 0; i < 5; i++) {
            double p;
            String n;
            int g;
            System.out.println("---");
            System.out.print(" -> Ingrese Nombre del alumno: ");
            n = Lector.leerString();
            System.out.print(" -> Ingrese Puntaje: ");
            p = Lector.leerDouble();
            System.out.print(" -> Ingrese Genero: ");
            g = Lector.leerInt();
            C.actualizarPuntajePorNombre(g, n, p);
            System.out.println("---");
        }

        System.out.println(C.toString());
    }
}
