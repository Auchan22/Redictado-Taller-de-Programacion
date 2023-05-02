/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author agust
 */
public class Estanteria {
    private int FILAS, COLUMNAS;
    private Libro[][] mLibros;
    private int DIML = 0;
    private int actualFila = 0, actualColumna = 0;
    
    public  Estanteria(int N, int M){
        this.FILAS = N;
        this.COLUMNAS = M;
        this.mLibros = new Libro[N][M];
    }
    
    public void almacenarLibro(Libro L){
        if(this.DIML < (this.FILAS * this.COLUMNAS)){
            if(actualColumna < this.COLUMNAS){
                mLibros[actualFila][actualColumna] = L;
                actualColumna++;
                this.DIML++;
            }else{
                actualColumna = 0;
                actualFila++;
                mLibros[actualFila][actualColumna] = L;
                this.DIML++;
            }
        }else{
            System.out.println("Estantería llena");
        }
    }
    
    private boolean estaRangoFila(int X){
        return (X > 0) && (X < this.FILAS);
    }
    
     private boolean estaRangoColumna(int Y){
        return (Y > 0) && (Y < this.COLUMNAS);
    }
    
    public Libro sacarLibro(int X, int Y){
        Libro L = null;
        if(estaRangoFila(X) && estaRangoColumna(Y)){
            if(mLibros[X-1][Y-1] != null){
                L = mLibros[X-1][Y-1];
                mLibros[X-1][Y-1] = null;
            }
        }
        
        return L;
    }
    
    public int calcular(String nombre){
        int total = 0;
        
        for(int i = 0; i < this.FILAS; i++){
            for(int j = 0; j < this.COLUMNAS; j++){
                if(mLibros[i][j] != null){
                    if(mLibros[i][j].getAutor().equals(nombre)){
                        total++;
                    }
                }
            }
        }
        
        return total;
    }
}
