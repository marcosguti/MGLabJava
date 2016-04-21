/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.app;

import dao.ReportDaoImpl;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author eimar
 */
public class Report implements Controller {

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("application/pdf");
//        response.setContentType("text/html");

//        context = new ClassPathXmlApplicationContext("classpath:test-context.xml");
//        ClassPathXmlApplicationContext appContext = new ClassPathXmlApplicationContext("META-INF/applicationContext.xml");
        ServletOutputStream out = response.getOutputStream();
//        Map parameters = GetParameters(request);
        Map parameters = getParameters(request);
        Map map = new HashMap();
        if (parameters.containsKey("paciente_id")) {
            String pid = (String) (parameters.get("paciente_id"));
            parameters.put("paciente_id", Integer.parseInt(pid));
            //parameters.put("paciente_id", 128);
            //map.put("paciente_id", Integer.valueOf(pid));
        }
        if (parameters.containsKey("resultado_id")) {
            String rid = (String) (parameters.get("resultado_id"));
            parameters.put("resultado_id", Integer.parseInt(rid));
            //parameters.put("resultado_id", 435);
            //map.put("resultado_id", Integer.valueOf(rid));
            
        }
        parameters.put("SUBREPORT_DIR", getClass().getResource("/reports").getPath());

        map.put("SUBREPORT_DIR", getClass().getResource("/reports").getPath());
        try {
            JRExporter exporter = new JRPdfExporter();
            //reportDao = new ReportDaoImpl();
//            JasperPrint jasperPrint = reportDao.generatePdfReport(getClass().getResource("/reports/LabReport.jrxml").getPath(), parameters);
//                JasperPrint print = reporDaoImpl.generatePdfReport(getClass().getResource("../reports/LabReport.jrxml").getPath(), reportMap);//              Interfaz_principal.jDesktopPane1.add(new JRViewer(print));

//            JasperPrint jasperPrint = generarReporte(getClass().getResource("/reports/LabReport.jrxml").getPath(), parameters);
//          
//            String reportPath = getClass().getResource("/reports/LabReport.jrxml").getPath();
//            JasperReport report = JasperCompileManager.compileReport(reportPath);
//            
//            JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameters, coneccionSQL());
            JasperPrint jasperPrint = JasperFillManager.fillReport(getClass().getResource("/reports/LabReport.jasper").getPath(),
                    parameters, coneccionSQL());

            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
            exporter.exportReport();
            out.close();
            //JasperViewer.viewReport(jasperPrint, false);
            //return new ModelAndView("home");
        } catch (Exception e) {
            e.printStackTrace();
        }
//        return new ModelAndView("redirect");
        return null;
    }

    private Connection coneccionSQL() {

        try {

//                    Class.forName("com.mysql.jdbc.Driver");
// 
//                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pruebareportes", "root", "r00t");
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/lab", "postgres", "123456");
            return con;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;

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
