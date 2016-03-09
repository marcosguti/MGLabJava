/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.app;

import controller.PacienteController;
import domain.Paciente;
import hibernateUtil.BussinessException;
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
public class DefaultController  {
//    ApplicationContext applicationContext= new ClassPathXmlApplicationContext("controller/controller-business.xml");
//        ApplicationContext applicationContext= new AnnotationConfigApplicationContext(AppConfig.class);
//
//    
//    PacienteController pacienteController=(PacienteController )applicationContext.getBean("pacienteController");
//
//    PacienteController pacienteController = new PacienteController();
//
//    
//       
//    Paciente paciente =null;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("saludo", "Probando El Controller");
        return "home";
    }

    @RequestMapping(value = "/somepage", method = RequestMethod.GET)
    public String somepage(Model model, @RequestParam("nombre") String nombre) {
        model.addAttribute("nombre", nombre);
        return "somepage";
    }
}
