/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import domain.Paciente;
import domain.Prueba;
import hibernateUtil.BussinessException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author marcosguti
 */
public class PruebaDAOImpl extends GenericDAOImplHibernate<Prueba, Integer> implements PruebaDAO {

    @Override
    public List<Prueba> getPruebas(String nombreGrupoPruebas) throws BussinessException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        try {
            Query query
                    = session.createQuery(
                            "SELECT e FROM Prueba e WHERE e.grupoPruebas.nombre = ?");
            query.setParameter(0, nombreGrupoPruebas);
            List<Prueba> pruebas = (List<Prueba>) query.list();
            session.getTransaction().commit();
            if (pruebas != null) {
                return pruebas;
            }

//			session.beginTransaction();
//			Paciente entity = (Paciente) session.get(, cedula);
//			session.getTransaction().commit();
//
//			return entity;
        } catch (Exception w) {
            w.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean delete(String nombre) throws BussinessException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        try {
            Query query
                    = session.createQuery(
                            "SELECT e FROM Prueba e WHERE e.nombre = ?");
            query.setParameter(0, nombre);
            Prueba prueba = (Prueba) query.uniqueResult();
            session.getTransaction().commit();
            if (prueba != null) {
                delete(prueba);
            }

//			session.beginTransaction();
//			Paciente entity = (Paciente) session.get(, cedula);
//			session.getTransaction().commit();
//
//			return entity;
        } catch (Exception w) {
            w.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public Prueba get(String nombre) throws BussinessException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        try {
            Query query
                    = session.createQuery(
                            "SELECT e FROM Prueba e WHERE e.nombre = ?");
            query.setParameter(0, nombre);
            Prueba prueba = (Prueba) query.uniqueResult();
            session.getTransaction().commit();
            if (prueba != null) {
                return prueba;
            }

        } catch (Exception w) {
            w.printStackTrace();
        }
        return null;
    }

    @Override
    public Map<String, Prueba> getMapAll() throws BussinessException {
         List<Prueba> pruebas=findAll();
      Map <String, Prueba> map=new HashMap<String, Prueba>();
        for (Prueba prueba : pruebas) {
            map.put(String.valueOf(prueba.getId()), prueba);
        }
      return map;
    }
}
