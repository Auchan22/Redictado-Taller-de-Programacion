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
public class Referendum extends Urna {
    private int cantFavor, cantContra;
    
    public Referendum(int U, Zona Z){
        super(U, Z);
        this.cantContra = 0;
        this.cantFavor = 0;
    }

    public int getCantFavor() {
        return cantFavor;
    }

    public void setCantFavor(int cantFavor) {
        this.cantFavor = cantFavor;
    }

    public int getCantContra() {
        return cantContra;
    }

    public void setCantContra(int cantContra) {
        this.cantContra = cantContra;
    }
    
    public void votarAFavor(){
        this.setCantFavor(getCantFavor() + 1);
    }
    
    public void votarEnContra(){
        this.setCantContra(getCantContra() + 1);
    }

    @Override
    public int calcularGanador() {
        int aux = 0;
        if(getCantFavor() > getCantContra()){
            aux = 1;
        }else if(getCantContra() > getCantFavor()){
            aux = -1;
        }
        return aux;
    }
    
    public int calcularTotalVotos(){
        int aux = super.getCantVotosBlanco() + this.getCantContra() + this.getCantFavor();
        
        return aux;
    }
    
    
}
