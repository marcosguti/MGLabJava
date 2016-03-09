/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.app;

import controller.PacienteController;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 *
 * @author marcosguti
 */
//@Configuration
public class AppConfig {
//    @Bean 
    public PacienteController pacienteController(){
        return new PacienteController();
    }
    
////     @Bean 
//    public DefaultController defaultController(){
//        return new DefaultController();
//    }
}
