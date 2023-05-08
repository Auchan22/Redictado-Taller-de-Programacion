/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author agust
 */
public class index {

    public static void main(String[] args) {
        Fecha f = new Fecha(2, 4);

        Alumno a1 = new Alumno("Juan", 604);
        f.agregarAlumno(2, a1);

        Alumno a2 = new Alumno("Sofia", 287);
        f.agregarAlumno(2, a2);

        Alumno a3 = new Alumno("Mariangeles", 407);
        f.agregarAlumno(1, a3);

        Alumno a4 = new Alumno("Lucas", 324);
        f.agregarAlumno(1, a4);

        Alumno a5 = new Alumno("Luciano", 285);
        f.agregarAlumno(2, a5);

        Alumno a6 = new Alumno("Natalia", 923);
        f.agregarAlumno(1, a6);

        f.asignarTema();

        int nroTema = 2;
        System.out.println(f.toString(nroTema));
    }
}
