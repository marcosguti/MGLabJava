package dao;

import java.util.List;

import hibernateUtil.BussinessException;

import domain.Paciente;
import java.util.Map;

public interface PacienteDAO extends GenericDAO<Paciente, Integer> {
	public Paciente getByNombreCedula(String nombre, String cedula) throws BussinessException;
        public List<Paciente> getAllOrdered() throws BussinessException;
        public Map<String,Paciente> getMapAll() throws BussinessException;
//	public boolean deleteByCed(String cedula) throws BussinessException;
}
