/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional;

import PaqueteLectura.Lector;

/**
 *
 * @author agust
 */
public class main {

    public static void main(String[] args) {
        Zona Z1 = new Zona("Berisso", "Berisso", "Buenos Aires");

        Electoral UE = new Electoral(203, 5, Z1);
        Referendum UR = new Referendum(204, Z1);

        System.out.println("--- INICIANDO VOTACION---");
        System.out.println(" ");
        System.out.print(" -> Ingrese nro de dni: ");
        int dni = Lector.leerInt();
        while (dni != 0) {
            System.out.print(" -> Ingrese nro de Lista: ");
            int N = Lector.leerInt();
            UE.votarPorLista(N);
            System.out.print(" -> Ingrese nro para  Referendum: ");
            int M = Lector.leerInt();
            if (M > 0) {
                UR.votarAFavor();
            } else if (M < 0) {
                UR.votarEnContra();
            } else if (M == 0) {
                UR.votarEnBlanco();
            }
            System.out.print(" -> Ingrese nro de dni: ");
            dni = Lector.leerInt();
        }
        System.out.println("--- FINALIZANDO VOTACION---");
        System.out.println(" ");
        System.out.println(UE.toString());
        System.out.println(UR.toString());
        
    }
}
