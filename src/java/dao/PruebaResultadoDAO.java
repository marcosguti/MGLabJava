/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import domain.Paciente;
import domain.Prueba;
import domain.PruebaResultado;
import hibernateUtil.BussinessException;
import java.util.List;

/**
 *
 * @author marcosguti
 */
public interface PruebaResultadoDAO extends GenericDAO<PruebaResultado, Integer>  {
     public List<PruebaResultado> getPruebasResultado(String idResultado) throws BussinessException;
      public boolean delete(String nombre) throws BussinessException;
      public Prueba get(String nombre) throws BussinessException;
}
