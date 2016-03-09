/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import domain.GrupoPruebas;
import domain.Paciente;
import domain.Prueba;
import hibernateUtil.BussinessException;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author marcosguti
 */
public class GrupoPruebasDAOImpl extends GenericDAOImplHibernate<GrupoPruebas, Integer> implements GrupoPruebasDAO  {

    @Override
    public boolean delete(String nombre) {
      Session session = sessionFactory.getCurrentSession();
                        session.beginTransaction();
		try {
			Query query = 
					session.createQuery(
							"SELECT e FROM GrupoPruebas e WHERE e.nombre = ?");
			query.setParameter(0, nombre);
			GrupoPruebas grupoPrueba = (GrupoPruebas)query.uniqueResult();
                        session.getTransaction().commit();
			if(grupoPrueba!=null)
                        delete(grupoPrueba);
			
			
			
//			session.beginTransaction();
//			Paciente entity = (Paciente) session.get(, cedula);
//			session.getTransaction().commit();
//
//			return entity;
		} catch(Exception w){
                  w.printStackTrace();
                  return false;
                }    
       return true;
        
    }

    
    
}
