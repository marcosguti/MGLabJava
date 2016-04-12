<%-- 
    Document   : home
    Created on : 12/02/2016, 08:50:49 AM
    Author     : eimar
--%>
<!--Reconocer ficheros .jss y .js-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!---->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
   

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <script type="text/javascript">
            function unloadEvt() {

                document.location.href = "${pageContext.request.contextPath}/viewReporte?id=2";

            }
            //alert(this.unloadEvt());
        </script>
    </head>
    <body>
        <%--<%@ include file="pag.html" %>--%> 
        <!--reporte-->

        <form action="${pageContext.request.contextPath}/viewReporte">
            <input type="text" name="id" />
            <input type="submit" value="Imprimir" />
        </form>

        <!--<object type="application/pdf" data="http://localhost:8080/spring/viewReporte" width="1000" height="650"></object>-->
        home
        <% // response.sendRedirect("report");%>


    </body>
</html>