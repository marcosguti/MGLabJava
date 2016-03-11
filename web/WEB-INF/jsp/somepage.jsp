<%-- 
    Document   : somepage
    Created on : 09/03/2016, 09:33:10 AM
    Author     : marcosguti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table border="1" >
         <c:forEach var="ob" varStatus="status" items="${pacientes}">
    <tr>
        <td><c:out value="${ob.nombres}"/></td>
        <td><c:out value="${ob.cedula}"/></td>

    </tr>
             </c:forEach></table>
        <p style="text-align: center"><h1>nombre: ${paciente.nombres}</h1></p>
    <p style="text-align: center"><h1>cedula: ${paciente.cedula}</h1></p>
    </body>

</html>
