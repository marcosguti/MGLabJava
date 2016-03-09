/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import hibernateUtil.BussinessException;
import hibernateUtil.BussinessMessage;
import hibernateUtil.HibernateUtil;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 * Implementa de forma genérica el acceso a la base de datos mediante Hibernate.
 * Las 2 clases ProfesorDAOImplHibernate y UsuarioDAOImplHibernate que
 * reutilizan todo el código de GenericDAOImplHibernate ya que heredan de
 * GenericDAOImplHibernate y de esa forma evitaremos duplicar el código de
 * Hibernate en cada entidad.
 * 
 * @author emilio
 * 
 * @param <T>
 * @param <ID>
 */
public class GenericDAOImplHibernate<T, ID extends Serializable> implements
		GenericDAO<T, ID> {

	SessionFactory sessionFactory;

	static final Logger LOGGER = Logger
			.getLogger(GenericDAOImplHibernate.class.getName());

	public GenericDAOImplHibernate() {
		sessionFactory = HibernateUtil.getSessionFactory();
	}

	@Override
	public T create() throws BussinessException {
		try {
			return getEntityClass().newInstance();
		} catch (RuntimeException ex) {
			throw ex;
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

	@Override
	public void saveOrUpdate(T entity) throws BussinessException {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(entity);
			session.getTransaction().commit();
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

	@Override
	public T get(ID id) throws BussinessException {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.beginTransaction();
			T entity = (T) session.get(getEntityClass(), id);
			session.getTransaction().commit();

			return entity;
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

	@Override
	public void delete(T entity) throws BussinessException {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.beginTransaction();
			session.delete(entity);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	@Override
	public List<T> findAll() throws BussinessException {
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
                try {

			Query query = session.createQuery("SELECT e FROM "
					+ getEntityClass().getSimpleName() + " e");
			List<T> entities = query.list();
                        session.getTransaction().commit();
			return entities;
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

	private Class<T> getEntityClass() {
		return (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}
        public void saveOrUpdate(Collection T) throws BussinessException {
           
		
	}
}
