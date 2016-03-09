 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author marcosguti
 */

public class GrupoPruebas {
    
    private int id;
    
    private String Nombre;
    
    private List<Prueba> Pruebas;

    public GrupoPruebas() {
    }

    public GrupoPruebas(String Nombre) {
        this.Nombre = Nombre;
    }

    public GrupoPruebas(String Nombre, List<Prueba> Pruebas) {
        this.Nombre = Nombre;
        this.Pruebas = Pruebas;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public List<Prueba> getPruebas() {
        return Pruebas;
    }

    public void setPruebas(List<Prueba> Pruebas) {
        this.Pruebas = Pruebas;
    }
    
}
