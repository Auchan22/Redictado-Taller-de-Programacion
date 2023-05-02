/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3;

/**
 *
 * @author agust
 */
public abstract class Recital {

    private String nombreBanda;
    private String[] vTemas;
    private int DIMF = 0;
    private int DIML = 0;
    //private int temaActual = 0;

    public Recital(String n, int cant) {
        this.nombreBanda = n;
        this.DIMF = cant;
        this.vTemas = new String[this.DIMF];
    }

    public String getNombreBanda() {
        return this.nombreBanda;
    }

    public int getDIML() {
        return this.DIML;
    }

    /*public int getTemaActual(){
       return this.temaActual;
   }*/
    public void agregarTema(String n) {
        if (this.DIML < this.DIMF) {
            vTemas[this.DIML] = n;
            this.DIML++;
        } else {
            System.out.println("El vector de temas esta lleno");
        }
    }

    public void actuar() {
        for (int i = 0; i < this.DIML; i++) {
            System.out.println("Y ahora tocaremos... " + vTemas[i]);
        }
    }
    
    public abstract int calcularCosto();
}
