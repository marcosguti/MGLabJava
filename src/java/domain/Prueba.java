/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import javax.persistence.*;

/**
 *
 * @author marcosguti
 */
@Entity
@Table(name = "prueba")
public class Prueba {
@Id
    @Column(name = "id")
    @GeneratedValue
    private int id;
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "unidad")
    private String unidad;
      @Column(name = "limites")
    private String limites;
        @Column(name = "precio")
    private int precio;
    @ManyToOne
    @JoinColumn(name = "grupopruebas_id")
    private GrupoPruebas grupoPruebas;

  
    public Prueba(){}
  
    public Prueba( String nombre, String unidad, String limites,GrupoPruebas grupoPruebas, int precio){

        this.nombre = nombre;
        this.unidad = unidad;
        this.limites=limites;
        this.grupoPruebas = grupoPruebas;
        this.precio= precio;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public String getLimites() {
        return limites;
    }

    public void setLimites(String limites) {
        this.limites = limites;
    }

  
    
        public GrupoPruebas getCatalogo() {
        return grupoPruebas;
    }

    public void setCatalogo(GrupoPruebas grupoPruebas) {
        this.grupoPruebas = grupoPruebas;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public GrupoPruebas getGrupoPruebas() {
        return grupoPruebas;
    }

    public void setGrupoPruebas(GrupoPruebas grupoPruebas) {
        this.grupoPruebas = grupoPruebas;
    }
}
