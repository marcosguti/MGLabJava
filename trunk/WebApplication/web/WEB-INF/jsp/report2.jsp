<%@ page contentType="application/pdf" %>


<%@ page trimDirectiveWhitespaces="true"%>



<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>
<%@ page import="java.util.*" %>


<%
//getClass().getResource("/reports/LabReport.jasper").getPath()
JasperPrint print = JasperFillManager.fillReport( getClass().getResource("/reports/LabReport.jasper").getPath(),
    new HashMap(),
    new JREmptyDataSource());


JasperExportManager.exportReportToPdfStream(print,    
    response.getOutputStream());

%>