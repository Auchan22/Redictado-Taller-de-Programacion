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
public class Zona {
    private String localidad, partido, provincia;

    public Zona(String localidad, String partido, String provincia) {
        this.localidad = localidad;
        this.partido = partido;
        this.provincia = provincia;
    }

    public String getLocalidad() {
        return localidad;
    }

    public String getPartido() {
        return partido;
    }

    public String getProvincia() {
        return provincia;
    }
    
    public String toString(){
        return this.localidad + "-"+this.partido+"-"+this.provincia;
    }
    
}
