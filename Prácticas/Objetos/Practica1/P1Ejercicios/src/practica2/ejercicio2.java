/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author agust
 */
public class ejercicio2 {
    
    public static Persona leerPersona(){
        Persona p = null;
        System.out.println("---");
        String n = "";
        int e, dni = 0;
        e = GeneradorAleatorio.generarInt(100);
        System.out.println(" -> Edad de la Persona: "+ e);
        if(e != 0){
            dni = GeneradorAleatorio.generarInt(100);
            n = GeneradorAleatorio.generarString(7);
            System.out.println(" -> Nombre de la persona: "+ n);
            System.out.println(" -> DNI de la persona: "+ dni);
            
        }
        p = new Persona(n, dni, e);
        System.out.println("---");
        return p;
    }
    
    /*public static void cantMayor(Persona[] v, int dl){
        int cant = 0;
        for(int i = 0; i < dl; i++){
            if(v[i].getEdad() > 65){
                cant = cant + 1;
            }
        }
        System.out.println(" La cantidad de personas con edad mayor a 65 años es: "+ cant);
    }
    
    public static Persona minimo(Persona[] v, int dl){
        Persona minPersona = null;
        int minDni = 999;
        for(int i = 0; i < dl; i++){
            if(v[i].getDNI() < minDni){
                minDni = v[i].getDNI();
                minPersona = v[i];
            }
        }
        return minPersona;
    }
    
    public static void informarMinDni(Persona[] v, int dl){
        System.out.println(" ");
        Persona minPersona = getMinDni(v, dl);
        if(minPersona != null){
            System.out.println(minPersona.toString());
        }
        System.out.println(" ");
    }*/
    
    public static void recorrerVector(Persona[] v, int dl){
        Persona minPersona = null;
        int minDni = 999;
        int cant = 0;
        for(int i = 0; i < dl; i++){
            if(v[i].getDNI() < minDni){
                minDni = v[i].getDNI();
                minPersona = v[i];
            }
            
            if(v[i].getEdad() > 65){
                cant = cant + 1;
            }
        }
        
        System.out.println(" La cantidad de personas con edad mayor a 65 años es: "+ cant);
        System.out.println(" ");
        if(minPersona != null){
            System.out.println(minPersona.toString());
        }
        System.out.println(" ");
    }
    
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        int DIMF = 15;
        int DIML = 0;
        Persona[] v = new Persona[DIMF];
        
        Persona p = leerPersona();
        while((DIML < DIMF) && (p.getEdad() != 0)){
            v[DIML] = p;
            DIML = DIML + 1;
            p = leerPersona();
        }
        
        /*cantMayor(v, DIML);
        
        informarMinDni(v, DIML);*/
        
        recorrerVector(v, DIML);
    }
}
