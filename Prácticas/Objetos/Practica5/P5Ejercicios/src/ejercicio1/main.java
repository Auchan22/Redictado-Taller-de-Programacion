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
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Proyecto P = new Proyecto("Los Futbolistas Facheritos", 244, "Carlos Bianchi");
        
        Subsidio S1 = new Subsidio(25000, "Investigaciones");
        Subsidio S2 = new Subsidio(15000, "Compra de Material");
        Subsidio S3 = new Subsidio(2000, "Reparación de maquinaria");
        Subsidio S4 = new Subsidio(3000 , "Descubrimiento 2");
        Subsidio S5 = new Subsidio(3000 , "Descubrimiento 3");
        Subsidio S6 = new Subsidio(3000 , "Descubrimiento 4");
        
        Investigador I1 = new Investigador("Pepe Sand", 2, "Biotecnología");
        Investigador I2 = new Investigador("Licha Lopez", 5, "Nanociencia");
        Investigador I3 = new Investigador("Pablo Perez", 1, "Radiología");
        
        I1.agregarSubsidio(S1);
        I1.agregarSubsidio(S2);
        
        I2.agregarSubsidio(S3);
        I2.agregarSubsidio(S4);
        
        I3.agregarSubsidio(S5);
        I3.agregarSubsidio(S6);
        
        P.agregarInvestigador(I1);
        P.agregarInvestigador(I2);
        P.agregarInvestigador(I3);
        
        P.otorgarTodos("Pepe Sand");
        P.otorgarTodos("Licha Lopez");
        
        System.out.println(P.toString());
    }
    
}
