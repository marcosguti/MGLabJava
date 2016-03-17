/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.app;

import controller.PacienteController;
import dao.PacienteDAOImpl;
import domain.Paciente;
import hibernateUtil.BussinessException;
import java.util.Date;
import java.util.List;
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

    PacienteDAOImpl pacienteDAO = new PacienteDAOImpl();

    public DefaultController() {
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) throws BussinessException {

//        Paciente paciente= new Paciente("17322319", "Marco Gutierrez", "04120765408", "M", "Santa Cruz De Mora", 28);
//        PacienteController pacienteController =new PacienteController();
//        PacienteDAOImpl pacienteDAO = new PacienteDAOImpl();
        Date date = new Date();
        List<Paciente> pacientes = pacienteDAO.getAllOrdered();
        model.addAttribute("saludo", "Probando El Controller");
        model.addAttribute("date", date.toString());
        model.addAttribute("pacientes", pacientes);
//        model.addAttribute("paciente",paciente);
        return "home";
    }

    @RequestMapping(value = "/tables", method = RequestMethod.GET)
    public String home(Model model) throws BussinessException {
        List<Paciente> pacientes = pacienteDAO.getAllOrdered();
        model.addAttribute("pacientes", pacientes);
        model.addAttribute("saludo", "Probando El Controller");
        return "tables";
    }

    @RequestMapping(value = "/registrarpaciente", method = RequestMethod.GET)
    public String pacienteView() {

        return "registrarpaciente";
    }

    @RequestMapping(value = "registro", method = RequestMethod.POST)
    public String registrarPaciente(Model model, @RequestParam("nombre") String nombre, @RequestParam("cedula") String cedula , @RequestParam("edad") String edad) throws BussinessException {
        Paciente paciente = new Paciente();
        paciente.setNombres(nombre);
        paciente.setEdad(Integer.parseInt(edad));
        paciente.setCedula(cedula);
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
}