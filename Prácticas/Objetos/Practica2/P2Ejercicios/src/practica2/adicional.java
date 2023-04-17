/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;
import practica2.Auto;
import PaqueteLectura.Lector;

/**
 *
 * @author agust
 */
public class adicional {
    
    public static void inicializarMatriz(Auto[][] m, int f, int c){
        for(int i = 0; i < f; i++){
            for(int j= 0; j < c; j++){
                m[i][j] = null;
            }
        }
    }
    
    public static Auto leerAuto(){
        System.out.print(" -> Ingrese Patente: ");
            int p = Lector.leerInt();
            System.out.print(" -> Ingrese nombre del Dueño: ");
            String n = Lector.leerString();
            
            Auto a = new Auto();
            a.setDueño(n);
            a.setPatente(p);
            
            return a;
    }
    
    public static void cargarMatriz(Auto[][] m){
        for(int i = 0; i < 5; i++){
            System.out.println("---");
            System.out.println("Leyendo datos del auto: "+(i+1));
            System.out.println("---");
            
            System.out.println(" ");
            Auto a = leerAuto();
            
            System.out.print(" -> Ingrese Piso (1-5): ");
            int piso = Lector.leerInt();
            System.out.print(" -> Ingrese Plaza (1-10): ");
            int plaza = Lector.leerInt();
            System.out.println(" ");
            
            
            m[piso-1][plaza-1] = a;
        }
    }
    
    public static void imprimirMatriz(Auto[][] m, int f, int c){
        for(int i = 0; i < f; i++){
            for(int j = 0; j < c; j++){
                System.out.println("---");
                System.out.println("Imprimiendo datos del lugar: ");
                System.out.println(" -> Piso: "+ (i+1));
                System.out.println(" -> Plaza: "+ (j+1));
                System.out.println("---");
                if(m[i][j] != null){
                    System.out.println(m[i][j].toString());
                }else{
                    System.out.println("Lugar libre...");
                }
                   
            }
            
        }
    }
    
   public static void main(String[] args){
       
       int PISOS = 5, PLAZAS = 10;
       
       Auto[][] mEstacionamiento = new Auto[PISOS][PLAZAS];
       
       //Inicializar matriz
       inicializarMatriz(mEstacionamiento, PISOS, PLAZAS);
       
       //Cargando Matriz
       cargarMatriz(mEstacionamiento);
       
       //Inciso c -> Imprimir Matriz
       imprimirMatriz(mEstacionamiento, PISOS, PLAZAS);
   } 
}
