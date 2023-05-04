/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialLibros;

/**
 *
 * @author agust
 */
public class index {
    public static void main(String[] args){
        LibroElectronico LE = new LibroElectronico(".pdf", 12, "El amanecer de los muertos", 2500);
        LibroImpreso LP = new LibroImpreso(true, "Martín Fierro", 1250);
        
        LE.agregarAutor("Miguelito");
        LE.agregarAutor("Pepe");
        LE.agregarAutor("Sandra");
        
        LP.agregarAutor("Jose");
        LP.agregarAutor("Miriam");
        LP.agregarAutor("Alberto");
        
        System.out.println(LE.toString());
        System.out.println(LP.toString());
    }
}
