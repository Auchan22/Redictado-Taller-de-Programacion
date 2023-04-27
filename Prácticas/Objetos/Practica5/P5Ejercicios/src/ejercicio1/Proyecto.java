package ejercicio1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author agust
 */
public class Proyecto {

    private String nombre, nombreDirector;
    private int codigo;
    private int DIMF = 50;
    private int DIML = 0;
    private Investigador[] vInvestigadores;

    public Proyecto(String n, int c, String nD) {
        this.nombre = n;
        this.codigo = c;
        this.nombreDirector = nD;
        vInvestigadores = new Investigador[DIMF];
    }

    public String getNombre() {
        return nombre;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public int getCodigo() {
        return codigo;
    }

    public void agregarInvestigador(Investigador unInvestigador) {
        if (DIML < DIMF) {
            vInvestigadores[DIML] = unInvestigador;
            DIML++;
        } else {
            System.out.println("Vector lleno");
        }
    }

    public double dineroTotalOtorgado() {
        double total = 0;
        for (int i = 0; i < DIML; i++) {
            Investigador iActual = vInvestigadores[i];
            total = total + iActual.totalDinero();
        }

        return total;
    }

    private Investigador buscarInvestigadorPorNombre(String n) {
        int i = 0;
        boolean esta = false;
        Investigador I = null;

        while ((i < DIML) && (!esta)) {
            if (vInvestigadores[i].getNombreCompleto().equals(n)) {
                esta = true;
                I = vInvestigadores[i];
            } else {
                i++;
            }
        }

        return I;
    }

    //Preguntar si una clase puede tener un getter de un vector
    public void otorgarTodos(String nombre_completo) {
        Investigador I = buscarInvestigadorPorNombre(nombre_completo);
        if (I != null) {
            System.out.println(I.getNombreCompleto());

            I.otorgarSubsidios();
        }
    }

    public String toString() {
        String aux = "Nombre Proyecto: " + getNombre() + " | Codigo: " + getCodigo() + " | Nombre Director: " + getNombreDirector() + " | Total dinero Otorgado: " + dineroTotalOtorgado() + "\n";

        for (int i = 0; i < DIML; i++) {
            Investigador IActual = vInvestigadores[i];
            aux = aux + " -> Nombre Investigador: " + IActual.getNombreCompleto() + " | Categoria: " + IActual.getCategoria() + " | Especialidad: " + IActual.getEspecialidad() + " | Todal dinero de subsidios otorgados: " + IActual.totalDinero() + "" + " \n";
        }

        return aux;
    }
}
