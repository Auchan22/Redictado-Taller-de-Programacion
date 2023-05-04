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
public class Funcion {

    private String titulo, fecha, hora;
    private Butaca[][] mButacas;
    private int Filas, Columnas;

    public Funcion(String titulo, String fecha, String hora, int N, int M) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.Filas = N;
        this.Columnas = M;
        this.mButacas = new Butaca[N][M];
        this.inicializarMatriz();
    }

    public String getTitulo() {
        return titulo;
    }

    public String getFecha() {
        return fecha;
    }

    public String getHora() {
        return hora;
    }

    private void inicializarMatriz() {
        String descriptor = "";
        double precio = 0;
        for (int i = 0; i < Filas; i++) {
            for (int j = 0; j < Columnas; j++) {
                descriptor = "Butaca " + (i + 1) + "" + (j + 1);
                precio = 800 + (100 * i);
                mButacas[i][j] = new Butaca(descriptor, precio);
            }
        }
    }

    private boolean estaEnRangoFila(int X) {
        return (X > 0) && (X <= Filas);
    }

    private boolean estaEnRangoColumna(int Y) {
        return (Y > 0) && (Y <= Columnas);
    }

    public double ocuparButaca(int B, int F) {
        double precio = 0;
        if (estaEnRangoColumna(B) && estaEnRangoFila(F)) {
            Butaca actual = mButacas[F - 1][B - 1];
            if (actual.isOcupada()) {
                System.out.println("Lugar Ocupado");
            } else {
                actual.setOcupada(true);
                precio = actual.getPrecio();
            }
        } else {
            System.out.println("Fuera de rango");
        }
        return precio;
    }

    public void desocuparFila(int F) {
        if (estaEnRangoFila(F)) {
            for (int j = 0; j < Columnas; j++) {
                mButacas[F - 1][j].setOcupada(false);
            }
        } else {
            System.out.println("Fuera de rango");
        }
    }

    public String obtenerDatosButaca(int B) {
        String aux = "";

        if (estaEnRangoColumna(B)) {
            for (int i = 0; i < Filas; i++) {
                aux = aux + " -> "+ mButacas[i][B-1].toString() + "\n";
            }
        }

        return aux;
    }
    
    public String toString(){
        String aux = "Titulo: "+titulo+" | Fecha: "+fecha+" | Hora: "+hora;
        
        for(int j = 0; j < Columnas; j++){
            aux = aux + this.obtenerDatosButaca(j+1);
        }
        
        return aux;
    }

}
