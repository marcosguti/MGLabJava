/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author marcosguti
 */
@Entity
@Table(name = "resultado")
public class Resultado {

    @Id
    @Column(name = "id")
    @GeneratedValue
    private int id;
    @ManyToOne
    @JoinColumn(name = "paciente_id")
    private Paciente paciente;

//    private List<PruebaResultado> pruebasResultado;
    @Column(name = "precio")
    private int precio;
    @Column(name = "observaciones")
    private String observaciones;
    @Column(name = "fecha")
    private Date fecha;

    public Resultado() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

//    public List<PruebaResultado> getPruebasResultado() {
//        return pruebasResultado;
//    }
//
//    public void setPruebasResultado(List<PruebaResultado> pruebasResultado) {
//        this.pruebasResultado = pruebasResultado;
//    }
    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

}
