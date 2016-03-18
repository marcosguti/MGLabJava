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
        <!-- JQuery  -->
        <script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js' />"></script>
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
        <div id="wrapper">

            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Registro de Paciente
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <form role="form" action="/Laboratorio/registro" method="POST" id="register-form" novalidate="novalidate">
                                    <div class="col-lg-6">


                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input name="nombre" class="form-control" placeholder="Nombre" data-fv-field="email">
                                        </div>

                                        <div class="form-group ">
                                            <label>Edad</label>
                                            <div class="form-inline">
                                                <input name="edad" class="form-control " placeholder="Edad">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Sexo</label>
                                            <select name="sexo" class="form-control">
                                                <option>M</option>
                                                <option>F</option>

                                            </select>
                                        </div>

                                        <div id="myModal" class="modal fade" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Desea Registrar El Paciente?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-primary">Si <span class="glyphicon glyphicon-ok"></span></button>
                                                        <button type="button" class="btn btn-primary" data-dismiss="modal">No <span class="glyphicon glyphicon-remove"></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">

                                        <div class="form-group">
                                            <label>Cedula</label>
                                            <div class="form-inline"> 
                                                <select name="selectDoc" class="form-control">
                                                    <option>V</option>
                                                    <option>E</option>
                                                    <option>J</option>
                                                </select>
                                                <input name="cedula" class="form-control " placeholder="N° de Documento">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input name="direccion" class="form-control" placeholder="Direccion">
                                        </div>
                                        <div class="form-group">
                                            <label>Telefono</label>
                                            <input name="telefono"  class="form-control" placeholder="Telefono">
                                        </div>
                                        <div class="btn-group">
                                            <!--<button type="submit" class="btn btn-primary " data-toggle="modal" data-tar ="#myModal">Guardar</button>-->
                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                            <button type="reset" class="btn btn-primary">Borrar</button>
                                        </div>
                                    </div>
                                </form>

                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>

                <!-- /.col-lg-12 -->
            </div>
            <!-- /.col-lg-8 -->

            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

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




</body>
</html>