/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.Prueba;
import dao.PruebaDAO;
import dao.PruebaDAOImpl;
import hibernateUtil.BussinessException;
import java.util.List;

/**
 *
 * @author marcosguti
 */
public class PruebaController {

    PruebaDAO pruebaDAO;

    public PruebaController() {
        pruebaDAO = new PruebaDAOImpl();
    }

    public void guardar(Prueba grupoPruebas) throws BussinessException {

        pruebaDAO.saveOrUpdate(grupoPruebas);
    }

    public List< Prueba> getAll() throws BussinessException {

        return pruebaDAO.findAll();
    }

    public List<Prueba> getPruebas(String nombre) throws BussinessException {
        return pruebaDAO.getPruebas(nombre);
    }

    public boolean delete(String nombre) throws BussinessException {
        return pruebaDAO.delete(nombre);
    }
    public Prueba get(String nombre) throws BussinessException {
        return pruebaDAO.get(nombre);
    }
}
