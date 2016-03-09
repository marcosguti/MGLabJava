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
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author marcosguti
 */
public class PruebaResultadoDAOImpl extends GenericDAOImplHibernate<PruebaResultado, Integer> implements PruebaResultadoDAO {

  
    public List<PruebaResultado> getPruebasResultado(String idResultado) throws BussinessException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        try {
            Query query
                    = session.createQuery(
                            "SELECT e FROM PruebaResultado e WHERE e.resultado = ?");
            query.setParameter(0, idResultado);
            List<PruebaResultado> pruebas = (List<PruebaResultado>) query.list();
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
    public boolean delete(String idResultado) throws BussinessException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        try {
            Query query
                    = session.createQuery(
                            "SELECT e FROM PruebaResultado e WHERE e.resultado = ?");
            query.setParameter(0, idResultado);
            PruebaResultado pruebaResultado = (PruebaResultado) query.uniqueResult();
            session.getTransaction().commit();
            if (pruebaResultado != null) {
                delete(pruebaResultado);
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

//    @Override
//    public List<Prueba> getPruebas(String nombreGrupoPruebas) throws BussinessException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
}
