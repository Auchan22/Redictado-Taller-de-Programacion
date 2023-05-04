/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialTDT12022;

/**
 *
 * @author agust
 */
public class index {

    public static void main(String[] args) {
        CursoPresencial CP = new CursoPresencial(2023, 5, 15);
        CursoDistancia CD = new CursoDistancia(2023, 8, "zoom.com");

        Alumno alumno1 = new Alumno(12345678, "Juan"); //El unico que va a rendir del curso Presencial
        Alumno alumno2 = new Alumno(87654321, "Pedro");
        Alumno alumno3 = new Alumno(13579246, "Ana");
        Alumno alumno4 = new Alumno(24681357, "María");
        Alumno alumno5 = new Alumno(36985214, "Luisa");
        Alumno alumno6 = new Alumno(95182746, "Lucas");
        Alumno alumno7 = new Alumno(78451236, "Valentina"); //Los unicos que van a rendir del curso a distancia
        Alumno alumno8 = new Alumno(36854129, "Manuel"); //Los unicos que van a rendir del curso a distancia
        
        CP.agregarAlumno(alumno1);
        CP.agregarAlumno(alumno3);
        CP.agregarAlumno(alumno5);
        
        CD.agregarAlumno(alumno2);
        CD.agregarAlumno(alumno4);
        CD.agregarAlumno(alumno6);
        CD.agregarAlumno(alumno7);
        CD.agregarAlumno(alumno8);
        
        CP.incrementarAsistencia(12345678);
        CP.incrementarAsistencia(12345678);
        CP.incrementarAsistencia(12345678);
        CP.incrementarAsistencia(13579246);
        CP.incrementarAsistencia(13579246);
        CP.incrementarAsistencia(13579246);
        CP.incrementarAsistencia(12345679); //Tiene que darnos un error
        
        CD.incrementarAsistencia(78451236);
        CD.incrementarAsistencia(36854129);
        CD.incrementarAsistencia(36854120); //Tiene que darnos error
        
        CD.aprobarAutoevaluacion(78451236);
        CD.aprobarAutoevaluacion(78451236);
        CD.aprobarAutoevaluacion(78451236);
        CD.aprobarAutoevaluacion(36854129);
        CD.aprobarAutoevaluacion(36854129);
        CD.aprobarAutoevaluacion(36854129);
        
        System.out.println("Alumnos a rendir del Curso Presencial: "+CP.cantidadDeAlumnosQuePuedenRendir());
        System.out.println("Alumnos a rendir del Curso a Distancia: "+CD.cantidadDeAlumnosQuePuedenRendir());
        
    }
}
