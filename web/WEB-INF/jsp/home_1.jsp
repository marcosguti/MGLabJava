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

        <title>Laboratorio</title>

        <!-- Bootstrap Core CSS -->
        <link href="<c:url value='/resources/bower_components/bootstrap/dist/css/bootstrap.min.css' />" rel="stylesheet">
        <!--<script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js' />"></script>-->
   <!--<script src="<c:url value='/resources/marco/marco.js' />"></script>-->
        <!-- JQuery -->
        <script src="<c:url value='/resources/bower_components/jquery/dist/1.12/jquery.min.js' />"></script>
        <!-- MetisMenu CSS -->
        <link href="<c:url value='/resources/bower_components/metisMenu/dist/metisMenu.min.css' />" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="<c:url value='/resources/dist/css/timeline.css' />" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="<c:url value='/resources/dist/css/sb-admin-2.css' />" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="<c:url value='/resources/bower_components/morrisjs/morris.css' />" rel="stylesheet">
        <!-- DataTables CSS -->
        <link href="<c:url value='/resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css' />" rel="stylesheet">

        <!-- DataTables Responsive CSS -->
        <link href="<c:url value='/resources/bower_components/datatables-responsive/css/dataTables.responsive.css' />" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="<c:url value='/resources/bower_components/font-awesome/css/font-awesome.min.css' />" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
        <style>
            @import url("<c:url value='/resources/bower_components/bootstrap/dist/css/bootstrap.min.css' />");
            .navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus, .navbar-inverse .navbar-nav>.open>a:hover, .navbar-inverse, .navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover{
                background-color: #337ab7 !important;
            }
            button.navbar-toggle.collapsed{
                display:none;
            }
            .navbar-nav>li>a {
                color: white !important;
            }
/*            .navbar-inverse {
                color: black !important;
            }*/
            .navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus, .navbar-inverse .navbar-nav>.open>a:hover{
                color : white !important;    
            }
            
            .panelColor{
                background-color: #1E1A1A;
                border-color: #1E1A1A;
            }
           
            body {
                    background-size: cover;
                /*background-image: url("<c:url value='/resources/images/Lab.jpg' />");*/ 
/*                no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                margin-top: 12%;    */
            }
            .btn[disabled] {
                cursor: default !important;
            }  
            .form-control[disabled] {
                cursor: default !important;
                background-color: white !important;
            }    
            table{
                border-radius 10px !important;
            }
            table#tablaPaciente {
                border-radius: 15px;
                border: 1px solid black;
                border-color: #337ab7;
            }
            input.form-control.input-sm {
                border-color: #337ab7;
            }
/*            tablaPaciente_wrapper>div>div>.dataTables_scrollBody {
                border-radius: 15px;
            }*/
            .dataTables_scrollHead{
                visibility:  hidden;
            }
            #tablaPaciente_wrapper>div>div.dataTables_scrollBody {
                border-radius: 15px;
                border-color: #337ab7;
            }
            table, th, td {
                border-color: #337ab7;
            }              

        </style>
        <script>
            $(document).ready(function () {

                $('.botonMenuPacientes').mouseenter(function () {
                    $('#listSubMenuPacientes').slideDown(20);
                });
                $('.menuPacientes').mouseleave(function () {
                    $('#listSubMenuPacientes').slideUp(20);
                });
                $('.botonMenuResultados').mouseenter(function () {
                    $('#listSubMenuResultados').slideDown(20);
                });
                $('.menuResultados').mouseleave(function () {
                    $('#listSubMenuResultados').slideUp(20);
                });
                $('.botonMenuPruebas').mouseenter(function () {
                    $('#listSubMenuPruebas').slideDown(20);
                });
                $('.menuPruebas').mouseleave(function () {
                    $('#listSubMenuPruebas').slideUp(20);
                });
                $('.botonMenuGrupoPruebas').mouseenter(function () {
                    $('#listSubMenuGrupoPruebas').slideDown(20);
                });
                $('.menuGrupoPruebas').mouseleave(function () {
                    $('#listSubMenuGrupoPruebas').slideUp(20);
                });

                $('#registrarPacientes').click(function () {
                    $("#includedContent").load("/Laboratorio/registrarpaciente");
                });
                $('#tablaPacientes').click(function () {
                    $("#includedContent").load("/Laboratorio/buscarpaciente");
                });
                $('#buscarResultado').click(function () {
                    $("#includedContent").load("/Laboratorio/buscarresultado");
                });
                $('#crearResultado').click(function () {
                    $("#includedContent").load("/Laboratorio/crearresultado");
                });
                $('#registrarPruebas').click(function () {
                    $("#includedContent").load("/Laboratorio/registrarprueba");
                });
                $('#tablaPruebas').click(function () {
                    $("#includedContent").load("/Laboratorio/buscarpruebas");
                });
//                $(".botonMenuResultados").unbind( "click" );
            });</script>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-inverse navbar-fixed-top" id="barraPrincipal">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="/Laboratorio/#">MGLab</a>
                    </div>
                    <div class="navbar-left ">
                        <ul class="nav navbar-nav">
                            <li class ="dropdown menuResultados">
                                <a href="" class=" botonMenuResultados" ><i class="fa fa-file-text fa-fw "></i> Resultado</a>
                                <ul class="dropdown-menu" id="listSubMenuResultados" style="display: none;">
                                    <li>
                                        <a href="#" id="crearResultado"><i class="fa fa-plus fa-fw "></i>Nuevo</a>
                                    </li>
                                    <li>
                                        <a href="#" id="buscarResultado"><i class="fa fa-search fa-fw "></i>Buscar</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown menuPacientes">
                                <a href="" class="botonMenuPacientes"><i class="fa fa-user fa-fw "></i> Paciente</a>
                                <ul class="dropdown-menu" id="listSubMenuPacientes" style="display: none;">
                                    <li>
                                        <a href="#" id="registrarPacientes"><i class="fa fa-plus fa-fw "></i>Registrar</a>
                                    </li>
                                    <li>
                                        <a href="#" id="tablaPacientes"><i class="fa fa-search fa-fw "></i>Buscar</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown menuPruebas">
                                <a href="" class="botonMenuPruebas" ><i class="fa fa-medkit fa-fw "></i> Prueba</a>
                                <ul class="dropdown-menu" id="listSubMenuPruebas" style="display: none;">
                                    <li>
                                        <a href="#" id="registrarPruebas"><i class="fa fa-plus fa-fw "></i>Nueva</a>
                                    </li>
                                    <li>
                                        <a href="#" id="tablaPruebas"><i class="fa fa-search fa-fw "></i>Buscar</a>
                                    </li>
                                </ul>
                            </li>
<!--                            <li class="dropdown menuGrupoPruebas">
                                <a href="" class="dropdown-toggle botonMenuGrupoPruebas" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-archive fa-fw "></i> Area</a>
                                <ul class="dropdown-menu" id="listSubMenuGrupoPruebas" style="display: none;">
                                    <li>
                                        <a href="#" id="registrarGrupoPruebas"><i class="fa fa-plus fa-fw "></i>Nuevo</a>
                                    </li>
                                    <li>
                                        <a href="#" id="tablaGrupoPruebas"><i class="fa fa-search fa-fw "></i>Buscar</a>
                                    </li>
                                </ul>
                            </li>-->
                        </ul>

                    </div>
                    <!--                    <div class="navbar-right">
                                            <iframe src="http://free.timeanddate.com/clock/i554y0y9/n4067/tlve4/fn7/fs20/fcfff/tct/pct/ftb/th2" frameborder="0" width="82" height="25" allowTransparency="true"></iframe>
                    
                                        </div>-->

                    <!--/.nav-collapse -->
                </div>
            </nav>
            <br><br><br><br>
            <div class="row-border" id="includedContent">

            </div>
            <!--            <footer class="footer">
                            <div class="container">
                                <p class="text-muted">Marco Gutierrez</p>
                            </div>
                        </footer>-->
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
        <!-- DataTables JavaScript -->
        <script src="<c:url value='/resources/bower_components/datatables/media/js/jquery.dataTables.min.js' />"></script>
        <script src="<c:url value='/resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js' />"></script>

        <!-- Custom Theme JavaScript -->
        <script src="<c:url value='/resources/dist/js/sb-admin-2.js' />"></script>
        <!-- Custom Theme JavaScript -->
        <script>
            $(document).ready(function () {
//               $("#barraPrincipal").css("background-color", "#337ab7 !important");
            });
        </script>

    </body>
</html>