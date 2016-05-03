/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.app;

import controller.PacienteController;
import controller.PruebaResultadoController;
import controller.ResultadoController;
import dao.GrupoPruebasDAOImpl;
import dao.PacienteDAOImpl;
import dao.PruebaDAOImpl;
import dao.PruebaResultadoDAOImpl;
import dao.ReportDaoImpl;
import dao.ResultadoDAOImpl;
import domain.GrupoPruebas;
import domain.Paciente;
import domain.Prueba;
import domain.PruebaResultado;
import domain.Resultado;
import hibernateUtil.BussinessException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
    PruebaResultadoDAOImpl pruebaResultadoDAO = new PruebaResultadoDAOImpl();
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
        return "buscarpaciente";
    }

    @RequestMapping(value = "/resultados", method = RequestMethod.POST)
//    public String guardarResultado(Model model,@RequestParam("pacienteId") String pacienteId,@RequestParam("observaciones") String observaciones,@RequestParam("pruebas") Object pruebas ) throws BussinessException {
    public String action(HttpServletRequest request, Model model) throws ParseException, BussinessException {

//            Map parameterMap = request.getParameterMap();
        //System.out.println(parameterMap.get("pruebas").toString()+" - "+parameterMap.get(0));
        Map param = getParameters(request);

        String pruebas = (String) (param.get("pruebas"));
        String pacienteId = (String) (param.get("pacienteId"));
        String obs = (String) (param.get("observaciones"));
        String pr = (String) (param.get("precio"));
        pr = pr.substring(0, pr.length() - 4);
        JSONArray json = (JSONArray) new JSONParser().parse(pruebas);
        System.out.println("paciente " + pacienteId);
        System.out.println("obs " + obs);
        System.out.println("pruebas " + pruebas);

//            System.out.println("idPrueba=" + json.get("idPrueba"));
//            System.out.println("valor=" + json.get("valor"));
//            Model model= new Model;
//            List<Resultado> resultados = resultadoDAO.getAllOrdered();
//            model.addAttribute("resultados", resultados);
//        StaticVarsBusiness.PruebasEnTabla
//        JTablePruebas.dtm
        Resultado resultado = new Resultado();
        resultado.setObservaciones(obs);
        resultado.setPaciente(pacienteDAO.get(Integer.parseInt(pacienteId)));
//            java.util.Date date = new java.util.Date();
//            Timestamp ts_now = new Timestamp(date.getTime());
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date today = new Date();
        resultado.setFecha(today);
        resultado.setPrecio(Integer.parseInt(pr));
        resultadoDAO.saveOrUpdate(resultado);
        int precioTotal = 0;
        ArrayList pruebaValor = new ArrayList();
        Integer idP;
        String Valor;
        for (int i = 0; i < json.size(); i++) {
            PruebaResultado pruebaResultado = new PruebaResultado();

            JSONObject row = (JSONObject) json.get(i);
//                System.out.println(json.get(i));
            String idPrueba, valor;
            idPrueba = (String) row.get("idPrueba");
            valor = (String) row.get("valor");
            Prueba prueba = pruebaDAO.get(Integer.parseInt(idPrueba));
            pruebaResultado.setPrueba(prueba);
            pruebaResultado.setValor(valor);
            pruebaResultado.setResultado(resultado);
            pruebaResultadoDAO.saveOrUpdate(pruebaResultado);
        }

        resultadoDAO.saveOrUpdate(resultado);

        List<Resultado> resultados = resultadoDAO.getAllOrdered();
//        model.addAttribute("resultados", resultados);
        model.addAttribute("idResultado", resultado.getId());
//        return "buscarresultado";
        return  "report";
    }

    @RequestMapping(value = "/buscarresultado", method = RequestMethod.GET)
    public String buscarResultado(Model model) throws BussinessException {
        List<Resultado> resultados = resultadoDAO.getAllOrdered();
        model.addAttribute("resultados", resultados);
        return "buscarresultado";
    }

    @RequestMapping(value = "/eliminarresultado", method = RequestMethod.POST)
    public String eliminarResultado(Model model, @RequestParam("id") String id) throws BussinessException {
//        System.out.println("aaa"+id+"aaaa");
        Resultado resultado = resultadoDAO.get(Integer.parseInt(id));
        resultadoDAO.delete(resultado);
        List<Resultado> resultados = resultadoDAO.getAllOrdered();
        model.addAttribute("resultados", resultados);
        return "buscarresultado";
    }

    @RequestMapping(value = "/eliminarpaciente", method = RequestMethod.POST)
    public String eliminarPaciente(Model model, @RequestParam("id") String id) throws BussinessException {
//        System.out.println("aaa"+id+"aaaa");
        Paciente paciente = pacienteDAO.get(Integer.parseInt(id));
        pacienteDAO.delete(paciente);
        List<Paciente> pacientes = pacienteDAO.getAllOrdered();
        model.addAttribute("pacientes", pacientes);
        return "buscarpaciente";
    }

    @RequestMapping(value = "/buscarpruebas", method = RequestMethod.GET)
    public String buscarPruebas(Model model) throws BussinessException {
        List<Prueba> pruebas = pruebaDAO.findAll();
        model.addAttribute("pruebas", pruebas);
        return "buscarpruebas";
    }

    @RequestMapping(value = "/mostrarpaciente", method = RequestMethod.POST)
    public String mostrarPaciente(Model model, @RequestParam("id") String id) throws BussinessException {
        Map<String, Paciente> mapPacientes = pacienteDAO.getMapAll();
        Paciente paciente = mapPacientes.get(id);
        System.out.println(id + paciente.getNombres());
        model.addAttribute("paciente", paciente);
        return "mostrarpaciente";
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

    @RequestMapping(value = "/registrarprueba", method = RequestMethod.GET)
    public String pruebaView(Model model) throws BussinessException {
        List<GrupoPruebas> grupoPruebas = grupoPruebasDAO.findAll();
        model.addAttribute("grupoPruebas", grupoPruebas);
        return "registrarprueba";
    }

    @RequestMapping(value = "/guardarpaciente", method = RequestMethod.POST)
    public String registrarPaciente(Model model, @RequestParam("nombre") String nombre, @RequestParam("documento") String documento, @RequestParam("selectDoc") String selectDoc, @RequestParam("edad") String edad, @RequestParam("sexo") String sexo, @RequestParam("direccion") String direccion, @RequestParam("telefono") String telefono) throws BussinessException {
        Paciente paciente = new Paciente();
        paciente.setNombres(nombre);
        paciente.setCedula(selectDoc + "-" + documento);
        paciente.setSexo(sexo);
        paciente.setDireccion(direccion);
        paciente.setEdad(Integer.parseInt(edad));
        paciente.setTelefono(telefono);
        pacienteDAO.saveOrUpdate(paciente);
        List<Paciente> pacientes = pacienteDAO.getAllOrdered();
        model.addAttribute("pacientes", pacientes);
        return "home2";
    }

    @RequestMapping(value = "/modificarpaciente", method = RequestMethod.POST)
    public String modificarPaciente(Model model, @RequestParam("id") String id, @RequestParam("nombre") String nombre/*, @RequestParam("documento") String documento, @RequestParam("tipoDoc") String tipoDoc*/, @RequestParam("edad") String edad/*, @RequestParam("sexo") String sexo*/, @RequestParam("direccion") String direccion/*, @RequestParam("telefono") String telefono*/) throws BussinessException {
        Paciente paciente = new Paciente();
        paciente.setNombres(nombre);
//        paciente.setCedula(tipoDoc + "-" + documento);
//        paciente.setSexo(sexo);
//        paciente.setDireccion(direccion);
//        paciente.setEdad(Integer.parseInt(edad));
//        paciente.setTelefono(telefono);
        paciente.setId(Integer.parseInt(id));
//        pacienteDAO.saveOrUpdate(paciente);
//        System.out.println(paciente.getNombres() + "   " + paciente.getId());
        List<Paciente> pacientes = pacienteDAO.getAllOrdered();
        model.addAttribute("pacientes", pacientes);
        return "home2";
    }

    @RequestMapping(value = "/registroPrueba", method = RequestMethod.POST)
    public String registrarPaciente(Model model, @RequestParam("selectGrupo") String grupo, @RequestParam("nombre") String nombre, @RequestParam("unidad") String unidad, @RequestParam("limSuperior") String limSuperior, @RequestParam("limInferior") String limInferior, @RequestParam("precio") String precio) throws BussinessException {
        Prueba prueba = new Prueba();
        System.out.println(nombre);
        return "home_1";
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

    private Map getParameters(HttpServletRequest request) {
        Map parametersInput = request.getParameterMap();
        Map parameters = new HashMap();

        Set s = parametersInput.entrySet();
        Iterator it = s.iterator();
        while (it.hasNext()) {
            Map.Entry<String, String[]> entry = (Map.Entry<String, String[]>) it
                    .next();
            String key = entry.getKey();
            String[] value = entry.getValue();
            parameters.put(key, value[0].toString());
        }
        return parameters;
    }
}
