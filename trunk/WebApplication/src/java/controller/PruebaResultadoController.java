/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.Prueba;
import domain.PruebaResultado;
import dao.PruebaDAO;
import dao.PruebaDAOImpl;
import dao.PruebaResultadoDAO;
import dao.PruebaResultadoDAOImpl;
import hibernateUtil.BussinessException;
import java.util.List;

/**
 *
 * @author marcosguti
 */
public class PruebaResultadoController {
    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




    PruebaResultadoDAO pruebaResultadoDAO;

    public PruebaResultadoController() {
        pruebaResultadoDAO = new PruebaResultadoDAOImpl();
    }

    public void guardar(PruebaResultado pruebaResultado) throws BussinessException {

        pruebaResultadoDAO.saveOrUpdate(pruebaResultado);
    }

    public List< PruebaResultado> getAll() throws BussinessException {

        return pruebaResultadoDAO.findAll();
    }

    public List<PruebaResultado> getPruebas(String nombre) throws BussinessException {
        return pruebaResultadoDAO.getPruebasResultado(nombre);
    }

    public boolean delete(String nombre) throws BussinessException {
        return pruebaResultadoDAO.delete(nombre);
    }
    public Prueba get(String nombre) throws BussinessException {
        return pruebaResultadoDAO.get(nombre);
    }


}
