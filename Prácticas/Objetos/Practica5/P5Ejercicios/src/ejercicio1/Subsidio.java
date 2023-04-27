/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1;

/**
 *
 * @author agust
 */
public class Subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado;
    
    public Subsidio(double m, String mo){
        this.monto = m;
        this.motivo = mo;
        this.otorgado = false;
    }

    public double getMonto() {
        return monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }
    
    public void setOtorgado(boolean b){
        this.otorgado = b;
    }
}
