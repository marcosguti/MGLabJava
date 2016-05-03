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
            .selected{
                background-color: #337ab7 !important;
                color: white;
            }    
            tr:hover.gradeX {
                background-color: #337ab7  !important ;
                color: white;
                cursor:pointer;
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
                $('#dataTables-example').DataTable({
                    responsive: true, "lengthMenu": [5, 10, 15, 20, 50, 100],
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"
                    }
                });
                var t = $('#tablapacientes').DataTable();
                $('#tablapacientes tbody').on('click', 'tr', function () {

                    //        alert( 'You clicked on '+name+'\'s row' );
                    //            alert("hola");td:nth-child(3)
                    //            $(this).toggleClass('selected');
//                                                                    alert($(this).children().length);
                    if ($(this).children().length > 1) {
                        if ($(this).hasClass('selected')) {
                            $(this).removeClass('selected');
                            $('#buttonBorrar').attr('disabled', 'disabled');
                            $('#buttonModificar').attr('disabled', 'disabled');
                        } else {
                            t.$('tr.selected').removeClass('selected');
                            $(this).addClass('selected');
                            $('#buttonModificar').removeAttr('disabled');
                            $('#buttonBorrar').removeAttr('disabled');
                        }
                    }
                });
//        function customAlert(msg) {
//            var alertDiv = "<div style='position: fixed; top: 20px; left: 20px;'>" + msg + "</div>";
//            document.getElementsByTagName('body').appendChild(alertDiv);
//        }
                $('#confirmarBorrar').on('click', function () {
                    var idDelete = $(".selected>td:last-child").text();
//                alert(idDelete);
                    $("#includedContent").load("/Laboratorio/eliminarpaciente", {id: idDelete});
//               alert( $(".selected").html());
                });
                $('#buttonModificar').on('click', function () {
                    var datos = [];
//        var i=0;
//         var a= $('.selected td:nth-child(1)').text();
//         alert(a);
//$('#lblName').parent().index();
                    $(".selected td").each(function () {
//                alert($(this).index());
                        datos.push($(this).text());

                    });
                    $('#nombre').attr('value', datos[0])
//            $('#selectDoc').attr('value',datos[1].str.substring(0, 1));
                    $('#documento').attr('value', datos[1].substring(2, 12))
                    $('#edad').attr('value', datos[2])
                    $('#sexo').attr('text', datos[3])
                    $('#telefono').attr('value', datos[4])
                    $('#direccion').attr('value', datos[5])
                    $('#id').attr('value', datos[6])
//                $("#includedContent").load("/Laboratorio/eliminarresultado", {id: idDelete});
//               alert( $(".selected").html());
                });
                $('#guardar').on('click', function () {
//                var idDelete=$(".selected>td:last-child").text();
//                alert(idDelete);
//                var nombre= $("#includedContent")
//            var ID = $("#id").val();
//            alert($("#nombre").val());

//        var nombre=$("#nombre").val();
//        var tipoDoc=$("#tipoDoc").val();
//        var documento=$("#documento").val();
//        var edad=$("#edad").val();
//        var sexo=$("#sexo").val();
//        var nombre=$("#nombre").val();

                    $("#includedContent").load("/Laboratorio/modificarpaciente", {
                        nombre: $("#nombre").val(),
//                    tipoDoc: $("#selectDoc").val(),
//                    documento: $("#documento").val(),
                        edad: $("#edad").val(),
//                    sexo: $("#sexo").val(),
                        direccion: $("#direccion").val(),
//                    telefono: $("#telefono").val(),
//
                        id: $("#id").val()
                    });
////               alert( $(".selected").html());
                });
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
                                <a href="" class="dropdown-toggle botonMenuResultados" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-file-text fa-fw "></i> Resultado</a>
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
                                <a href="" class="dropdown-toggle botonMenuPacientes" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user fa-fw "></i> Paciente</a>
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
                                <a href="" class="dropdown-toggle botonMenuPruebas" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-medkit fa-fw "></i> Prueba</a>
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
                <div id="wrapper">

                    <!-- Navigation -->

                    <div class="row">
                        <!--<div id="page-wrapper">-->

                        <!--<div class="container">-->
                        <div class="col-lg-11 ">
                            <div class="panel panel-primary">

                                <!--/.panel-heading--> 
                                <div class="panel-heading">
                                    Pacientes
                                </div>
                                <div class="panel-body center-block">
                                    <div class="dataTable_wrapper">
                                        <table class="table table-striped table-bordered table-hover" id="tablapacientes">
                                            <thead>
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Cedula</th>
                                                    <th>Edad</th>
                                                    <th>Sexo</th>
                                                    <th>Telefono</th>
                                                    <th>Direccion</th>
                                                    <th>ID</th>
                                                </tr>
                                            </thead>
                                            <tbody>  <c:forEach var="ob" varStatus="status" items="${pacientes}">
                                                    <tr class="odd gradeX">
                                                        <td><c:out value="${ob.nombres}"/></td>
                                                        <td><c:out value="${ob.cedula}"/></td>
                                                        <td><c:out value="${ob.edad}"/></td>
                                                        <td><c:out value="${ob.sexo}"/></td>
                                                        <td><c:out value="${ob.telefono}"/></td>
                                                        <td><c:out value="${ob.direccion}"/></td>
                                                        <td><c:out value="${ob.id}"/></td>
                                                    </tr>

                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                <div class="panel-body center-block">
                                    <!--<div class="bs-example">--> 
                                    <!--<button type="submit" class="btn btn-default">Guardar</button>-->
                                    <button type="button" class="btn btn-default " id="buttonModificar" disabled="disabled" data-toggle="modal" data-target ="#modalModificar">Modificar</button>
                                    <button type="button" class="btn btn-danger " id="buttonBorrar" disabled="disabled" data-toggle="modal" data-target ="#modalBorrar">Borrar</button>

                                    <!--</div>-->
                                </div>
                                <div class="modal fade" id="modalModificar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content modal-md">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Modificar Paciente</h4>

                                            </div>
                                            <form action="/Laboratorio/modificarpaciente" role="form" id="form " method="POST" >
                                                <div class="modal-body">

                                                    <!--<div class="col-lg-12">-->
                                                    <div class="row">
                                                        <div class="col-lg-8 col-xs-8 col-md-8 col-sm-8">
                                                            <div class="form-group">
                                                                <label>Nombre</label>
                                                                <input type="text" id="nombre" name="nombre" class="form-control" maxlength="40" placeholder="Nombre" required autofocus>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--<div class="row"><div class="col-lg-12" > <label>Documento</label></div></div>-->
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="form-group ">
                                                                <label>Documento</label>
                                                                <div class="form-inline">
                                                                    <select id="selectDoc" name="selectDoc" class="form-control">
                                                                        <option>V</option>
                                                                        <option>E</option>
                                                                        <option>J</option>
                                                                    </select>
                                                                    <input id="documento" name="cedula" class="form-control" minlength="8" maxlength="8" pattern="[0-9]{1,9}(\.[0-9]{0,2})?$" title="Introduzca Solo Numeros" placeholder="N° de Documento" required>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-2">
                                                            <div class="form-group ">
                                                                <label>ID</label>
                                                                <div class="form-inline">
                                                                    <input name="id" value="4" class="form-control"   id="id" type="text">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="row">
                                                        <!--<div class="col-lg-8">-->
                                                        <div class="col-lg-2">
                                                            <div class="form-group ">
                                                                <label>Edad</label>
                                                                <div class="form-inline">
                                                                    <input id="edad" name="edad" class="form-control " placeholder="Edad" maxlength="3" pattern="[0-1]{1}[0-9]{0,2}" title="Introduzca Una Edad Valida" size="3" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div class="form-group ">
                                                                <label>Sexo</label>
                                                                <select id="sexo" name="sexo" class="form-control" >
                                                                    <option>M</option>
                                                                    <option>F</option>

                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 ">
                                                            <div class="form-group">
                                                                <label>Telefono</label>
                                                                <input id="telefono" name="telefono"  class="form-control" maxlength="13" placeholder="Telefono" pattern="^\+?\d{1,3}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$" required>
                                                            </div>
                                                        </div>
                                                        <!--</div>-->
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-8 col-xs-8 col-md-8 col-sm-8">
                                                            <div class="form-group">
                                                                <label>Direccion</label>
                                                                <input id="direccion" name="direccion" class="form-control" maxlength="40" placeholder="Direccion" required>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>


                                                <div class="modal-footer">
                                                    <button id="guardar" type="button" class="btn btn-primary">Guardar</button>
                                                    <button type="reset" class="btn btn-primary">Reestablecer</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Atras</button>


                                                </div>
                                            </form> 
                                        </div>



                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="modalBorrar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="vertical-alignment-helper">
                                    <div class="modal-dialog vertical-align-center" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Resultado</h4>
                                            </div>
                                            <div class="modal-body">
                                                Desea Borrar El Paciente?    
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                                <button type="submit" class="btn btn-primary" id="confirmarBorrar" data-dismiss="modal">Si</button>
                                            </div>
                                        </div>
                                    </div></div>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div> 
                    <!-- /.col-lg-12 -->
                </div>

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