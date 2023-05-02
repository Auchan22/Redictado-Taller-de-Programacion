/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author agust
 */
public class index {

    public static void main(String[] args) {
        Fecha F = new Fecha(2, 4);

        Alumno a1 = new Alumno("Juan", 604);
        F.agregarAlumnoEnSala(1, a1);

        Alumno a2 = new Alumno("Sofia", 287);
        F.agregarAlumnoEnSala(2, a2);

        Alumno a3 = new Alumno("Mariangeles", 407);
        F.agregarAlumnoEnSala(1, a3);

        Alumno a4 = new Alumno("Lucas", 324);
        F.agregarAlumnoEnSala(1, a4);

        Alumno a5 = new Alumno("Luciano", 285);
        F.agregarAlumnoEnSala(2, a5);

        Alumno a6 = new Alumno("Natalia", 923);
        F.agregarAlumnoEnSala(1, a6);

        F.asignarTema();

        int nroTema = 2;
        System.out.println("Alumnos con el tema " + nroTema + ": \n" + F.toString(nroTema));
    }
}
