/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author agust
 */
public class ejercicio4 {
    
    public static void inicializarMatriz(Persona[][] m, int f, int c){
        for(int i = 0; i < f; i++){
            for(int j = 0; j < c; j++){
               m[i][j]= null; 
            }
        }
    }
    
    public static Persona leerPersona(){
        System.out.println("---");
        int dni = 0, edad = 0;
        String n;
        System.out.print(" -> Ingrese Nombre de la persona: ");
        n = Lector.leerString();
        if(!n.equals("ZZZ")){
            dni = GeneradorAleatorio.generarInt(100);
            System.out.println(" -> Ingrese DNI de la persona: "+ dni);
            edad = GeneradorAleatorio.generarInt(100);
            System.out.println(" -> Ingrese Edad de la persona: "+ edad);
        }
        Persona p = new Persona(n, dni, edad);
        System.out.println("---");
        return p;
    }
    
    public static void imprimirMatriz(Persona[][] m, int dl){
        int cantFilas = dl / 8; //Divido el total por las 5 filas, para obtener la cant de filas. Por ejemplo, 23/8 = 2
        int cantColumnas = 0;
        
        if(dl % 8 != 0) { //23%8 da como resto 7, por lo que ahi ya sumamos una fila mas, si teniamos 2, ahora tenemos 3
            cantFilas++;
        }
        
        //System.out.println(cantFilas);
        
        for (int i = 0; i < cantFilas; i++){
            
            int columnas = 0;
            
            //Por cada iteracón, nos fijamos si la cant de columnas llego a su total, es decir, dl, o le falta, por eso vamos actualizando columnas, que nos sirve para iterrar j
            if(cantColumnas + 8 <= dl){ 
                cantColumnas = cantColumnas + 8;
                columnas = 8;
            }else{
                //En el caso que nos falten numeros para llegar al total de 8 columnas, calculamos lo que nos queda. En nuestro ejemplo, haria la primer iteracion con 8, la segunda con 8 (ambas entran en el if), y la ultima con 7
                columnas = (dl - cantColumnas);
            }
            
            //System.out.println("Cantidad de columnas a imprimir: "+columnas);
            System.out.println("---");
            System.out.println("Personas a entrevistar en el dia "+ (i+1));
            for(int j = 0; j < columnas; j++){
               System.out.println("---");
               System.out.println("Personas a entrevistar en el turno "+ (j+1));
               System.out.println("     Nombre de la persona a Entrevistar: "+ m[i][j].getNombre());
            }
            System.out.println("---");
        }
    }
    
    public static void main(String[] args){
        int DIAS = 5; //Filas
        int PERSONAS = 8;//Columnas
        
        int DIMF = DIAS*PERSONAS;
        int DIML = 0;
        
        Persona[][] mPersonas = new Persona[DIAS][PERSONAS];
        inicializarMatriz(mPersonas, DIAS, PERSONAS);
        
        Persona p = leerPersona();
        int f = 0, c = 0;
        while((!p.getNombre().equals("ZZZ")) && (DIML < DIMF)){
            System.out.println("Cargando dia: "+(f+1)+" | Persona: "+(c+1));
            mPersonas[f][c] = p;
            DIML++;
            
            if(c < (PERSONAS - 1)){
                c++;
            }else{
                c = 0;
                f++;
            }    
            p = leerPersona();
        }
        
        imprimirMatriz(mPersonas, DIML);
    }
}
