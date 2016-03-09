/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import domain.Resultado;
import hibernateUtil.BussinessException;
import java.util.List;

/**
 *
 * @author marcosguti
 */
public interface ResultadoDAO extends GenericDAO<Resultado, Integer>  {
  
      public boolean delete(String id) throws BussinessException;
      public Resultado get(String id) throws BussinessException;
      public List<Resultado>getAllOrdered() throws BussinessException;
}
