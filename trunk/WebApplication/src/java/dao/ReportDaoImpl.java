/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author eimar
 */
public class ReportDaoImpl implements ReportDao {

    @Override
    public JasperPrint generatePdfReport(String contextPath, HashMap param) throws SQLException {

//        Connection conn = dataSource.getConnection();
//        param.put("id_paciente", 5);
        try {
            JasperReport report = JasperCompileManager.compileReport(contextPath);
            param.put("SUBREPORT_DIR", getClass().getResource("../reports/").getPath());
            
            JasperPrint print = JasperFillManager.fillReport(report, param, coneccionSQL());
          
//            JasperViewer.viewReport(print, false);
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

            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Laboratorio", "postgres", "312967");

            return con;

        } catch (Exception e) {

            System.out.println(e.getMessage());

        }

        return null;

    }

}
