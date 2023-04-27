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
public class Electoral extends Urna {

    private int cantListas;
    private Lista[] vLista;

    public Electoral(int U, int L, Zona Z) {
        super(U, Z);
        this.cantListas = L;
        vLista = new Lista[L];
        inicializarVector(cantListas);
    }

    private void inicializarVector(int L) {
        for (int i = 0; i < L; i++) {
            vLista[i] = new Lista();
        }
    }

    public int getCantListas() {
        return cantListas;
    }

    public boolean validarNumeroDeLista(int N) {
        return (N >= 0) && (N < getCantListas());
    }

    public void votarPorLista(int I) {
        if (validarNumeroDeLista(I)) {
            vLista[I].setCantVotos(vLista[I].getCantVotos() + 1);
            System.out.println("Votaste la lista: " + I);
        } else {
            super.votarEnBlanco();
            System.out.println("Votaste en blanco");

        }
    }

    public int devolverVotosPorLista(int I) {
        int aux = 0;
        if (validarNumeroDeLista(I)) {
            aux = vLista[I].getCantVotos();
        }
        return aux;
    }

    @Override
    public int calcularGanador() {
        int aux = 0;
        int maxVotos = -1;
        for (int i = 0; i < getCantListas(); i++) {
            if (vLista[i].getCantVotos() > maxVotos) {
                maxVotos = vLista[i].getCantVotos();
                aux = i;
            }
        }
        return aux;
    }

    public int calcularTotalVotos() {
        int aux = super.getCantVotosBlanco();

        for (int i = 0; i < getCantListas(); i++) {
            aux = aux + vLista[i].getCantVotos();
        }

        return aux;
    }

}
