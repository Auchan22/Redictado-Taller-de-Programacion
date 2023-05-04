/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialTCT22022;

/**
 *
 * @author agust
 */
public class index {
    public static void main(String[] args){
        Funcion F = new Funcion("Los Pinguinos de Madagascar", "22 de Junio de 2023", "21:00", 3, 3);
        F.ocuparButaca(2, 3);
        F.ocuparButaca(1, 3);
        F.ocuparButaca(3, 3);
        F.ocuparButaca(2, 1);
        F.ocuparButaca(2, 1);
        F.ocuparButaca(1, 1);
        System.out.println(F.obtenerDatosButaca(2));
        System.out.println(F.toString());
        F.desocuparFila(3);
        System.out.println(F.toString());
    }
}
