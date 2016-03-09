/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import domain.Paciente;
import domain.Prueba;
import domain.PruebaResultado;
import domain.Resultado;
import static dao.GenericDAOImplHibernate.LOGGER;
import hibernateUtil.BussinessException;
import java.util.List;
import java.util.logging.Level;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author marcosguti
 */
public class ResultadoDAOImpl extends GenericDAOImplHibernate<Resultado, Integer> implements ResultadoDAO {

  
    
    @Override
    public boolean delete(String idResultado) throws BussinessException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        try {
            Query query
                    = session.createQuery(
                            "SELECT e FROM Resultado e WHERE e.resultado = ?");
            query.setParameter(0, idResultado);
            Resultado resultado = (Resultado) query.uniqueResult();
            session.getTransaction().commit();
            if (resultado != null) {
                delete(resultado);
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
    public Resultado get(String id) throws BussinessException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        try {
            Query query
                    = session.createQuery(
                            "SELECT e FROM Resultado e WHERE e.id = ?");
            query.setParameter(0, id);
            Resultado resultado = (Resultado) query.uniqueResult();
            session.getTransaction().commit();
            if (resultado != null) {
                return resultado;
            }

        } catch (Exception w) {
            w.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Resultado> getAllOrdered() throws BussinessException {
         Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
                try {

			Query query = session.createQuery("SELECT e FROM Resultado e ORDER BY e.fecha DESC");
			List<Resultado> resultados = query.list();
                        session.getTransaction().commit();
			return resultados;
		} catch (javax.validation.ConstraintViolationException cve) {
			try {
				if (session.getTransaction().isActive()) {
					session.getTransaction().rollback();
				}
			} catch (Exception exc) {
				LOGGER.log(Level.WARNING, "Falló al hacer un rollback", exc);
			}
			throw new BussinessException(cve);
		} catch (org.hibernate.exception.ConstraintViolationException cve) {
			try {
				if (session.getTransaction().isActive()) {
					session.getTransaction().rollback();
				}
			} catch (Exception exc) {
				LOGGER.log(Level.WARNING, "Falló al hacer un rollback", exc);
			}
			throw new BussinessException(cve);
		} catch (RuntimeException ex) {
			try {
				if (session.getTransaction().isActive()) {
					session.getTransaction().rollback();
				}
			} catch (Exception exc) {
				LOGGER.log(Level.WARNING, "Falló al hacer un rollback", exc);
			}
			throw ex;
		} catch (Exception ex) {
			try {
				if (session.getTransaction().isActive()) {
					session.getTransaction().rollback();
				}
			} catch (Exception exc) {
				LOGGER.log(Level.WARNING, "Falló al hacer un rollback", exc);
			}
			throw new RuntimeException(ex);
		}
    }


 
}
