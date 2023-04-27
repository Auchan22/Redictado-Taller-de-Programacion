/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adicional;

/**
 *
 * @author agust
 */
public abstract class Urna {
    private int nro, cantVotosBlanco;
    private Zona zona;
    
    public Urna(int U, Zona Z){
        this.nro = U;
        this.zona = Z;
        this.cantVotosBlanco = 0;
    }

    public int getNro() {
        return nro;
    }
    
    public int getCantVotosBlanco() {
        return cantVotosBlanco;
    }

    public Zona getZona() {
        return zona;
    }
    
    public void votarEnBlanco(){
        this.cantVotosBlanco++;
    }
    
    public abstract int calcularGanador();
    
    public abstract int calcularTotalVotos();
    
    public String toString(){
        return "Urna: "+getNro() + ". Zona: "+getZona().toString() + ". Total Votos: "+ this.calcularTotalVotos() + ". Ganador: "+this.calcularGanador();
    }
}
