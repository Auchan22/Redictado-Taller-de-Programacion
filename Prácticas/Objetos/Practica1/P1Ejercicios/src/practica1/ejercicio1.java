/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author agust
 */
public class ejercicio1 {

    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        //System.out.println("2x" + "5" + "="+ tabla2[5]);
        int numRandom = GeneradorAleatorio.generarInt(DF + 1);
        while(numRandom != DF) {
            System.out.println("2x" + numRandom + "="+ tabla2[numRandom]);
            numRandom = GeneradorAleatorio.generarInt(DF + 1);
        }
    }
    
}
