/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.GrupoPruebas;
import domain.Prueba;
import dao.GrupoPruebasDAO;
import dao.GrupoPruebasDAOImpl;
import hibernateUtil.BussinessException;
import java.util.List;

/**
 *
 * @author marcosguti
 */
public class GrupoPruebasController {
    
    GrupoPruebasDAO grupoPruebasDAO;

    public GrupoPruebasController() {
        grupoPruebasDAO=new GrupoPruebasDAOImpl();
    }

    public void guardar(GrupoPruebas grupoPruebas) throws BussinessException {

    	grupoPruebasDAO.saveOrUpdate(grupoPruebas);
    }
    
    
    public List< GrupoPruebas >getAll( ) throws BussinessException {

    	return grupoPruebasDAO.findAll();
    }
       public boolean delete(String nombre) throws BussinessException{
    return grupoPruebasDAO.delete(nombre);
    }
    
}
