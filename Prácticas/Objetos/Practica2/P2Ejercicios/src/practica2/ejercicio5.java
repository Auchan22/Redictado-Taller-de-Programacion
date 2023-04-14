/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author agust
 */
public class ejercicio5 {
    
    public static void inicializarVector(Partido[] v, int df){
        for(int i = 0; i < df; i++){
            v[i] = null;
        }
    }
    
    public static Partido leerPartido(){
        String nl, nv;
        int gl = 0, gv = 0;
        System.out.println(" ");
        System.out.print(" -> Ingrese Nombre Local: ");
        nl = Lector.leerString();
        System.out.print(" -> Ingrese Nombre Visitante: ");
        nv = Lector.leerString();
        if(!nv.equals("ZZZ")){
            gl = GeneradorAleatorio.generarInt(10);
            gv = GeneradorAleatorio.generarInt(10);
            System.out.println(" -> Ingrese cantidad de goles Local: "+ gl);
            System.out.println(" -> Ingrese cantidad de goles Visitante: "+ gv);
        }
        System.out.println(" ");
        Partido p = new Partido(nl, nv, gl, gv);
        return p;
    }
    
    public static boolean ganoRiver(Partido p){
        return p.getGanador().equals("River");
    }
    
    public static boolean esLocalBoca(Partido p){
        return p.getLocal().equals("Boca");
    }
    
    public static String imprimirPartido(Partido p){
        String aux;
        aux = p.getLocal().toUpperCase() +": "+p.getGolesLocal() + " VS "+ p.getVisitante().toUpperCase() + ": "+ p.getGolesVisitante();
        
        return aux;
    }
    
    public static void recorrerVector(Partido[] v, int dl){
        int cantGanados = 0, cantGolesLocal = 0;
        for(int i = 0; i < dl; i++){
            System.out.println("---");
            System.out.println(imprimirPartido(v[i]));
            System.out.println("---");
            
            if(ganoRiver(v[i])){
                cantGanados++;
            }
            
            if(esLocalBoca(v[i])){
                cantGolesLocal = cantGolesLocal + v[i].getGolesLocal();
            }
        }
        System.out.println(" -> Cantidad de partidos ganados de River: "+cantGanados);
        System.out.println(" -> Cantidad de Goles que realizó Boca como Local: "+cantGolesLocal);
    }
    
    
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        
        int DIMF = 20;
        int DIML = 0;
        
        Partido[] vPartido = new Partido[DIMF];
        
        inicializarVector(vPartido, DIMF);
        
        System.out.println(" ");
        System.out.println("Iniciando Carga...");
        System.out.println(" ");
        
        Partido p = leerPartido();
        while((!p.getVisitante().equals("ZZZ")) && (DIML < DIMF)){
            vPartido[DIML] = p;
            DIML++;
            
            p = leerPartido();
        }
        
        System.out.println(" ");
        System.out.println("Iniciando Carga...");
        System.out.println(" ");
        
        recorrerVector(vPartido, DIML);
    }
}
