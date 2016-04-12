package controlador.app;

import dao.ReportDao;
import dao.ReportDaoImpl;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.view.JasperViewer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

/**
 *
 */
@Controller
public class ReportController extends HttpServlet {
    
    private ReportDao reportDao;
    
    public void setReportDao(ReportDao reportDao) {
        this.reportDao = reportDao;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        
        //String idWell = request.getParameter("idwell");
        //response.getWriter().print("<p> La variable vale " + idWell + "</p>");
        //response.setHeader("Content-Disposition", "attachment; filename=\"reporte.pdf\";");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("application/pdf");
        
//        context = new ClassPathXmlApplicationContext("classpath:test-context.xml");
//        ClassPathXmlApplicationContext appContext = new ClassPathXmlApplicationContext("META-INF/applicationContext.xml");
        ServletOutputStream out = response.getOutputStream();
        try {
//            HashMap param = new HashMap();
             HashMap<String, Object> reportMap = new HashMap<String, Object>();
       
             
            reportMap.put("resultado_id", 451);
            reportMap.put("paciente_id", 130);
            reportMap.put("observaciones", "TODO FINO");
            reportMap.put("fecha", "29/03/2016");
            //param.put("idWell", idWell);
//            param.put("id", 2);
            JRExporter exporter = new JRPdfExporter();
            reportDao=new ReportDaoImpl();
            JasperPrint jasperPrint = reportDao.generatePdfReport(getClass().getResource("/reports/LabReport.jrxml").getPath(), reportMap);
//                JasperPrint print = reporDaoImpl.generatePdfReport(getClass().getResource("../reports/LabReport.jrxml").getPath(), reportMap);//              Interfaz_principal.jDesktopPane1.add(new JRViewer(print));

//            JasperPrint jasperPrint = generarReporte(getClass().getResource("/reports/well.jrxml").getPath(), param);
//           
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
            exporter.exportReport();
            //JasperViewer.viewReport(jasperPrint, false);

            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Genera Reportes";
    }
    
    private JasperPrint generarReporte(String archivo, HashMap param) {
        try {
            JasperReport report = JasperCompileManager.compileReport(archivo);
//            param = new HashMap();
//            param.put("id", 2);
            JasperPrint print = JasperFillManager.fillReport(report, param, coneccionSQL());
            return print;
        } catch (JRException jRException) {
            System.out.println(jRException.getMessage());
        }
        return null;
        
    }
    
    private Connection coneccionSQL() {
        
        try {


//                    Class.forName("com.mysql.jdbc.Driver");
// 
//                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pruebareportes", "root", "r00t");
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pozos", "postgres", "123456");
            return con;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return null;
        
    }
}

