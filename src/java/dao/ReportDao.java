/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.HashMap;
import net.sf.jasperreports.engine.JasperPrint;

/**
 *
 * @author eimar
 */
public interface ReportDao {

    JasperPrint generatePdfReport(String contextPath, HashMap param) throws SQLException;
    
}
