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
public class index {

    public static void main(String[] args) {
        Sistema S = new Sistema();
        
        Paciente p1 = new Paciente("Juan", true, 250);
        S.agendarPaciente(p1, 2, 3);

        Paciente p2 = new Paciente("Sofia", true, 250);
        S.agendarPaciente(p2, 5, 2);

        Paciente p3 = new Paciente("Juan", true, 250);
        S.agendarPaciente(p3, 2, 5);

        S.liberarTurnos("Juan");

        if (S.estaAgendado(4, "Sofia")) {
            System.out.println("Tiene turno");
        } else {
            System.out.println("No Tiene turno");
        }
    }
}
