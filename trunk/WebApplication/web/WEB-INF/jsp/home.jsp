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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Bootstrap Admin Theme</title>

        <!-- Bootstrap Core CSS -->
        <link href="<c:url value='/resources/bower_components/bootstrap/dist/css/bootstrap.min.css' />" rel="stylesheet">
        <script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js' />"></script>
   <!--<script src="<c:url value='/resources/marco/marco.js' />"></script>-->
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
        <style>


        </style>
        <script>
            $(document).ready(function () {

                $('.botonMenuPacientes').click(function () {
                    $('#listSubMenuPacientes').slideToggle();
                });
//                $('.menuPacientes').mouseleave(function () {
//                     $('#listSubMenuPacientes').slideUp();
//                });
                $('.botonMenuResultados').click(function () {
                    $('#listSubMenuResultados').slideToggle();
                });
//                $('.menuResultados').mouseleave(function () {
//                    $('#listSubMenuResultados').slideToggle();
//                });
                $('.botonMenuPruebas').click(function () {
                    $('#listSubMenuPruebas').slideToggle();
                });
//                $('.menuPruebas').mouseleave(function () {
//                    $('#listSubMenuPruebas').slideToggle();
//                });

                $('#registrarPacientes').click(function () {
                    $("#includedContent").load("/Laboratorio/registrarpaciente");
                });
                $('#tablaPacientes').click(function () {
                    $("#includedContent").load("/Laboratorio/tables");
                });
            });</script>
    </head>
    <body>
        <div id="wrapper">

            <div class="row ">
                <div class="col-lg-12">
                    <!-- Navigation -->
                    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="">LabSolution</a>
                        </div>
                        <div class="navbar-default sidebar" role="navigation">
                            <div class="sidebar-nav navbar-collapse">
                                <ul class="nav" id="side-menu">
                                    <li class="sidebar-search">
                                        <div class="input-group custom-search-form">
                                            <input type="text" class="form-control" placeholder="Search...">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>
                                        <!-- /input-group -->
                                    </li>
                                    <li class ="menuResultados">
                                        <a href="#" class="botonMenuResultados"><i class="fa fa-file-text fa-fw "></i> Resultado<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level" id="listSubMenuResultados" style="display: none;">
                                            <li>
                                                <a href="#" id="nuevoResultado"><i class="fa fa-plus fa-fw "></i>  Nuevo</a>
                                            </li>
                                            <li>
                                                <a href="#" id="buscarResultado"><i class="fa fa-search fa-fw "></i>  Buscar</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class ="menuPacientes">
                                        <a href="#" class="botonMenuPacientes"><i class="fa fa-user fa-fw "></i> Paciente<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level" id="listSubMenuPacientes" style="display: none;">
                                            <li>
                                                <a href="#" id="registrarPacientes"><i class="fa fa-plus fa-fw "></i>  Registrar</a>
                                            </li>
                                            <li>
                                                <a href="#" id="tablaPacientes"><i class="fa fa-search fa-fw "></i>  Buscar</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class ="menuPruebas">
                                        <a href="#" class="botonMenuPruebas"><i class="fa fa-eyedropper"></i> Pruebas<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level" id="listSubMenuPruebas" style="display: none;">
                                            <li>
                                                <a href="#" id="registrarPruebas"><i class="fa fa-plus fa-fw "></i>  Crear</a>
                                            </li>
                                            <li>
                                                <a href="#" id="tablaPruebas"><i class="fa fa-search fa-fw "></i>  Buscar</a>
                                            </li>
                                        </ul>
                                    </li>

                            </div>
                        </div>
                        <!-- /.navbar-static-side -->
                    </nav>
                </div>
            </div>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">LabSolution</h1>
                    </div>
                </div>
                <div class="row" id="includedContent"></div>
            </div>

            <footer class="footer">
                <div class="container">
                    <p class="text-muted">Marco Gutierrez</p>
                </div>
            </footer>
        </div>

        <!-- jQuery -->
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