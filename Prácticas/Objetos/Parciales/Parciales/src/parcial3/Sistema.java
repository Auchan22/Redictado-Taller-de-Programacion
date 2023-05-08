/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial3;

/**
 *
 * @author agust
 */
public class Sistema {

    private int DIAS = 5, TURNOS = 6, dimL;
    private Paciente[][] mPacientes;

    public Sistema() {
        this.dimL = 0;
        this.mPacientes = new Paciente[this.DIAS][this.TURNOS];
    }

    public void agendarPaciente(Paciente P, int D, int T) {
        if (this.dimL < (this.DIAS * this.TURNOS)) {
            mPacientes[D - 1][T - 1] = P;
            this.dimL++;
        }else{
            System.out.println("La matriz esta llena");
        }
    }
    
    public void liberarTurnos(String n){
        for(int i = 0; i < DIAS; i++){
            for(int j = 0; j < TURNOS; j++){
                if(mPacientes[i][j] != null){
                    if(mPacientes[i][j].getNombre().equals(n)){
                        mPacientes[i][j] = null;
                    }
                }
            }
        }
    }
    
    public boolean estaAgendado(int D, String n){
        boolean aux = false;
        
        for(int i = 0; i < TURNOS; i++){
            if(mPacientes[D-1][i] != null){
                if(mPacientes[D-1][i].getNombre().equals(n)){
                    aux = true;
                }
            }
        }
        
        return aux;
    }
}
