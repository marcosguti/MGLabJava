<%-- 
    Document   : report
    Created on : 24/02/2016, 04:08:49 PM
    Author     : eimar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!--        <p id="p1">${idResultado}</p>
        <p id="p2">${pageContext.request.contextPath}</p>-->
        <%
//            String id = request.getParameter("idResultado");
//            String proy = request.getContextPath();
//            //String redirectURL = "http://whatever.com/myJSPFile.jsp";
//            response.sendRedirect(
        %>
        <!--${pageContext.request.contextPath}/viewReporte?${idResultado}-->
        
        
        <script>
            $(document).ready(function () {
                window.open("${pageContext.request.contextPath}/viewReporte?idResultado=${idResultado}");
            });
        </script>

    </body>

</html>
