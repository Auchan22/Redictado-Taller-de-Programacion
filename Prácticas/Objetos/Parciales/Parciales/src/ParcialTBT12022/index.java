/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialTBT12022;

/**
 *
 * @author agust
 */
public class index {

    public static void main(String[] args) {
        Torneo T = new Torneo("Champion Liga", 3, 4);

        Goleador goleador1 = new Goleador("Lionel Messi", "Barcelona", 30);
        Goleador goleador2 = new Goleador("Cristiano Ronaldo", "Manchester United", 25);
        Goleador goleador3 = new Goleador("Robert Lewandowski", "Bayern Munich", 32);
        Goleador goleador4 = new Goleador("Kylian Mbappé", "Paris Saint-Germain", 27);
        Goleador goleador5 = new Goleador("Erling Haaland", "Borussia Dortmund", 28);
        Goleador goleador6 = new Goleador("Harry Kane", "Tottenham Hotspur", 23);
        Goleador goleador7 = new Goleador("Karim Benzema", "Real Madrid", 22);
        
        //T.agregarGoleador(1, goleador1);
        T.agregarGoleador(2, goleador2);
        T.agregarGoleador(2, goleador4);
        T.agregarGoleador(2, goleador6);
        T.agregarGoleador(3, goleador5);
        T.agregarGoleador(3, goleador3);
        
        System.out.println("El total de goleadores del torneo: "+T.obtenerCantTotalGoleadores());
        System.out.println("El goleador de menos goles de la fecha 2: "+ T.obtenerGoleadorMin(2).toString());
        System.out.println(T.toString());
    }
}
