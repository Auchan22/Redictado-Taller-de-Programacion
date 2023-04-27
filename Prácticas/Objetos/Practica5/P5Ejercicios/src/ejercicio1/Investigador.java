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
public class Investigador {
    private String nombreCompleto, especialidad;
    private int categoria; //1-5
    private Subsidio[] vSubsidios;
    private int DIMF = 5;
    private int DIML = 0;
    
    public Investigador(String n, int c, String e){
        this.nombreCompleto = n;
        this.categoria = c;
        this.especialidad = e;
        vSubsidios = new Subsidio[DIMF];
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public int getCategoria() {
        return categoria;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if(DIML < DIMF){
            vSubsidios[DIML] = unSubsidio;
            DIML++;
        }else{
            System.out.println("Vector de subsidios lleno");
        }
    }
    
    public double totalDinero(){
        double total = 0;
        
        //System.out.println(DIML);
        for(int i = 0; i < DIML; i++){
            if(vSubsidios[i].isOtorgado()){
                System.out.println(getNombreCompleto() + " | "+ i+" | otorgado?: "+ vSubsidios[i].isOtorgado() );
                total = total + vSubsidios[i].getMonto();
            }
        }
        
        return total;
        
    }
    
    public void otorgarSubsidios(){
        for(int i = 0; i < DIML; i++){
            System.out.println(vSubsidios[i].getMotivo());
            vSubsidios[i].setOtorgado(true);
        }
    }
}
