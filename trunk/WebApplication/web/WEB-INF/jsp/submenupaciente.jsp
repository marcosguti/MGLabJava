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
        <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
        <link href="<c:url value='/resources/font-awesome/css/font-awesome.min.css' />" rel="stylesheet">
        <link href="<c:url value='/resources/css/animate.css' />" rel="stylesheet">
        <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet">
        <link href="<c:url value='/resources/color/default.css' />" rel="stylesheet">

        <script src="<c:url value='/resources/js/jquery.min.js' />"></script>

        <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>

        <script src="<c:url value='/resources/js/jquery.easing.min.js' />"></script>

        <script src="<c:url value='/resources/js/jquery.scrollTo.js' />"></script>

        <script src="<c:url value='/resources/js/wow.min.js' />"></script>
        <!-- Custom Theme JavaScript -->

        <script src="<c:url value='/resources/js/custom.js' />"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Bootstrap Admin Theme</title>

        <!-- Bootstrap Core CSS -->
        <link href="<c:url value='/resources/bower_components/bootstrap/dist/css/bootstrap.min.css' />" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="<c:url value='/resources/bower_components/metisMenu/dist/metisMenu.min.css' />" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="<c:url value='/resources/dist/css/timeline.css' />" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="<c:url value='/resources/dist/css/sb-admin-2.css' />" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="<c:url value='/resources/bower_components/morrisjs/morris.css' />" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="<c:url value='/resources/bower_components/font-awesome/css/font-awesome.min.css' />" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body> 


        <ul class="nav nav-second-level" id="listMenu">
            <li>
                <a href="#" id="registrarPacientes"><i class="fa fa-plus fa-fw "></i>  Registrar</a>
            </li>
            <li>
                <a href="#" id="tablaPacientes"><i class="fa fa-search fa-fw "></i>  Buscar</a>
            </li>
        </ul>
        <script src="<c:url value='/resources/bower_components/jquery/dist/jquery.min.js' />"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<c:url value='/resources/bower_components/bootstrap/dist/js/bootstrap.min.js' />"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="<c:url value='/resources/bower_components/metisMenu/dist/metisMenu.min.js' />"></script>

        <!-- Morris Charts JavaScript -->
        <script src="<c:url value='/resources/bower_components/raphael/raphael-min.js' />"></script>
        <script src="<c:url value='/resources/bower_components/morrisjs/morris.min.js' />"></script>
        <script src="<c:url value='/resources/js/morris-data.js' />"></script>

        <!-- Custom Theme JavaScript -->


    </body>
</html>