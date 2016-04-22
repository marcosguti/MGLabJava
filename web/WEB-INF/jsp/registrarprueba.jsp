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
                <div class="col-lg-4 col-lg-offset-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Registro de Prueba
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <form role="form" action="/Laboratorio/registroPrueba" method="POST" id="register-form" >
                                    <div class="col-lg-12">

                                        <div class="row">
                                            <div class="col-lg-12 col-xs-12 col-md-12 col-sm-12">
                                                <div class="form-group">
                                                    <label>Area</label>
                                                    <div class="form-inline"> 
                                                        <!--                                                        <div class="col-lg-4">-->
                                                        <select name="selectGrupo" class="form-control">
                                                            <c:forEach var="ob" varStatus="status" items="${grupoPruebas}">
                                                                <option id="${ob.id}"><c:out value="${ob.nombre}"/></option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <div class="form-group">
                                                            <label>Nombre</label>
                                                            <input type="text" id="nombre" name="nombre" class="form-control" maxlength="40" placeholder="Nombre" required autofocus>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="form-group">

                                                            <label>Unidad</label>
                                                            <input type="text" id="unidad" name="unidad" class="form-control" maxlength="10" placeholder="Unidad" required >
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <label>Limites</label>
                                                        <hr>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <div class="form-group">
                                                            <label>Inferior</label>
                                                            <input type="text" onkeypress='return ((event.charCode >= 48 && event.charCode <= 57)||event.charCode==44||event.charCode==46||event.charCode==0)'  id="limInferior" name="limInferior" class="form-control" maxlength="40" placeholder="Nombre" required autofocus>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div class="form-group">
                                                            <label>Superior</label>
                                                            <input type="text" onkeypress='return ((event.charCode >= 48 && event.charCode <= 57)||event.charCode==44||event.charCode==46||event.charCode==0)' id="limSuperior" name="limSuperior" class="form-control" maxlength="10" placeholder="Unidad" required >
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="form-group">
                                                            <label>Precio</label>
                                                            <input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' id="precio" name="precio" class="form-control" maxlength="10" placeholder="Unidad" required >
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6 ">
                                                <!--<button  class="btn btn-primary " data-toggle="modal" data-target ="#myModal">Guardar</button>-->
                                                <button type="button"class="btn btn-primary" data-toggle="modal" data-target ="#myModal">Guardar</button>
                                                <button type="reset" class="btn btn-primary">Borrar</button>
                                            </div>
                                        </div>
                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="myModalLabel">Registro de Prueba</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        Desea Registrar La Prueba?    
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                                        <button type="submit" class="btn btn-primary">Si</button>
                                                    </div>
                                                </div>
                                            </div>
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