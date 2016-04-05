/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.app;

import controller.PacienteController;
import dao.GrupoPruebasDAOImpl;
import dao.PacienteDAOImpl;
import dao.PruebaDAOImpl;
import dao.ResultadoDAOImpl;
import domain.GrupoPruebas;
import domain.Paciente;
import domain.Prueba;
import domain.Resultado;
import hibernateUtil.BussinessException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author PC
 */
@Controller
public class DefaultController {

    PruebaDAOImpl pruebaDAO = new PruebaDAOImpl();
    GrupoPruebasDAOImpl grupoPruebasDAO = new GrupoPruebasDAOImpl();

    PacienteDAOImpl pacienteDAO = new PacienteDAOImpl();
    ResultadoDAOImpl resultadoDAO = new ResultadoDAOImpl();

    public DefaultController() {
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) throws BussinessException {
        return "home_1";
    }

    @RequestMapping(value = "/buscarpaciente", method = RequestMethod.GET)
    public String buscarPaciente(Model model) throws BussinessException {
        List<Paciente> pacientes = pacienteDAO.getAllOrdered();
        model.addAttribute("pacientes", pacientes);
        model.addAttribute("saludo", "Probando El Controller");
        return "buscarpaciente";
    }

    @RequestMapping(value = "/buscarresultado", method = RequestMethod.GET)
    public String buscarResultado(Model model) throws BussinessException {
        List<Resultado> resultados = resultadoDAO.getAllOrdered();
        model.addAttribute("resultados", resultados);
        return "buscarresultado";
    }

    @RequestMapping(value = "/crearresultado", method = RequestMethod.GET)
    public String crearResultado(Model model) throws BussinessException {
        Map<String, List<Prueba>> mapTreePruebas = getTreePruebas();
        mapTreePruebas.remove("QUIMICA SANGUINEA");
//        List<Paciente> pacientes = pacienteDAO.getAllOrdered();
        Map<String, Paciente> mapPacientes = pacienteDAO.getMapAll();
        Map<String, Prueba> mapPruebas = pruebaDAO.getMapAll();
        model.addAttribute("treePruebas", mapTreePruebas);
        model.addAttribute("mapPacientes", mapPacientes);
        return "crearresultado";
    }

    @RequestMapping(value = "/registrarpaciente", method = RequestMethod.GET)
    public String pacienteView() {

        return "registrarpaciente";
    }

    @RequestMapping(value = "/registro", method = RequestMethod.POST)
    public String registrarPaciente(Model model, @RequestParam("nombre") String nombre, @RequestParam("cedula") String cedula, @RequestParam("selectDoc") String selectDoc, @RequestParam("edad") String edad, @RequestParam("sexo") String sexo, @RequestParam("direccion") String direccion, @RequestParam("telefono") String telefono) throws BussinessException {
        Paciente paciente = new Paciente();
        paciente.setNombres(nombre);
        paciente.setCedula(selectDoc + "-" + cedula);
        paciente.setSexo(sexo);
        paciente.setDireccion(direccion);
        paciente.setEdad(Integer.parseInt(edad));
        paciente.setTelefono(telefono);
        pacienteDAO.saveOrUpdate(paciente);
        return "home";
    }
//     @RequestMapping(value = "/Laboratorio/tables", method = RequestMethod.GET)
//    public String index2(Model model) {
//        model.addAttribute("saludo", "Probando El Controller");
//        return "tables";
//    }

    @RequestMapping(value = "/somepage", method = RequestMethod.POST)
    public String somepage(Model model, @RequestParam("id") String id) throws BussinessException {
//        PacienteDAOImpl pacienteDAO = new PacienteDAOImpl();
        List<Paciente> pacientes = pacienteDAO.getAllOrdered();
        Paciente paciente = pacienteDAO.get(Integer.parseInt(id));
        model.addAttribute("id", id);
        model.addAttribute("paciente", paciente);
        model.addAttribute("pacientes", pacientes);
        return "somepage";
    }

    public Map<String, List<Prueba>> getTreePruebas() throws BussinessException {
        List<GrupoPruebas> grupoPruebas = grupoPruebasDAO.findAll();
        Map<String, List<Prueba>> mapPruebas = new HashMap<String, List<Prueba>>();
        for (GrupoPruebas grupoPrueba : grupoPruebas) {
            List<Prueba> pruebas = new ArrayList<Prueba>();
            pruebas = pruebaDAO.getPruebas(grupoPrueba.getNombre());
            if (pruebas != null) {
                mapPruebas.put(grupoPrueba.getNombre(), pruebas);
            }
        }
        return mapPruebas;
    }
}
