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
    <!-- DataTables CSS -->
    <link href="<c:url value='/resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css' />" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="<c:url value='/resources/bower_components/datatables-responsive/css/dataTables.responsive.css' />" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<c:url value='/resources/dist/css/sb-admin-2.css' />" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<c:url value='/resources/bower_components/morrisjs/morris.css' />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value='/resources/bower_components/font-awesome/css/font-awesome.min.css' />" rel="stylesheet" type="text/css">
    <title>JSP Page</title>
    <style>
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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

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
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Modificar Paciente</h4>
                                </div>
                                <form role="form" action="/Laboratorio/#" method="POST" id="register-form" >
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
                                        <div class="row">
                                            <div class="col-lg-8 col-xs-8 col-md-8 col-sm-8">
                                                <div class="form-group">
                                                    <label>Documento</label>
                                                    <div class="form-inline"> 
                                                        <div class="col-lg-4">
                                                            <select name="selectDoc" class="form-control">
                                                                <option>V</option>
                                                                <option>E</option>
                                                                <option>J</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-lg-8">
                                                            <input name="cedula" class="form-control" minlength="8" maxlength="8" pattern="[0-9]{1,9}(\.[0-9]{0,2})?$" title="Introduzca Solo Numeros" placeholder="N° de Documento" required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-lg-8">
                                                <div class="col-lg-3">
                                                    <div class="form-group ">
                                                        <label>Edad</label>
                                                        <div class="form-inline">
                                                            <input id="age" name="edad" class="form-control " placeholder="Edad" maxlength="3" pattern="[0-1]{1}[0-9]{0,2}" title="Introduzca Una Edad Valida" size="3" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 ">
                                                    <div class="form-group ">
                                                        <label>Sexo</label>
                                                        <select name="sexo" class="form-control" >
                                                            <option>M</option>
                                                            <option>F</option>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 ">
                                                    <div class="form-group">
                                                        <label>Telefono</label>
                                                        <input name="telefono"  class="form-control" maxlength="13" placeholder="Telefono" pattern="^\+?\d{1,3}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$" required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-8 col-xs-8 col-md-8 col-sm-8">
                                                <div class="form-group">
                                                    <label>Direccion</label>
                                                    <input name="direccion" class="form-control" maxlength="40" placeholder="Direccion" required>
                                                </div>
                                            </div>

                                        </div>

                                    </div>


                                    <div class="modal-footer">
                                        <!--<div class="row">-->
                                        <!--<div class="col-lg-6 ">-->
                                        <button type="button"class="btn btn-primary">Guardar</button>
                                        <button type="reset" class="btn btn-primary">Borrar</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Atras</button>
                                        <!--<button type="submit" class="btn btn-primary" id="confirmarBorrar" data-dismiss="modal">Si</button>-->
                                        <!--</div>-->
                                        <!--</div>-->

                                    </div>
                                </form> 
                            </div>



                        </div>
                    </div>
                </div>
                <div class="modal fade" id="modalBorrar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Paciente</h4>
                            </div>
                            <div class="modal-body">
                                Desea Borrar El Paciente?    
                            </div>
                            <!--                                <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                                                <button type="submit" class="btn btn-primary" id="confirmarBorrar" data-dismiss="modal">Si</button>
                                                            </div>-->
                        </div>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div> 
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->

<!--</div>-->
<!-- /#wrapper -->

<script src="<c:url value='/resources/bower_components/jquery/dist/jquery.min.js' />"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value='/resources/bower_components/bootstrap/dist/js/bootstrap.min.js' />"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<c:url value='/resources/bower_components/metisMenu/dist/metisMenu.min.js' />"></script>


<script src="<c:url value='/resources/bower_components/datatables/media/js/jquery.dataTables.min.js' />"></script>
<script src="<c:url value='/resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js' />"></script>

<!-- Custom Theme JavaScript -->
<script src="<c:url value='/resources/dist/js/sb-admin-2.js' />"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function () {
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
        $('#confirmarBorrar').on('click', function () {
            var idDelete = $(".selected>td:last-child").text();
//                alert(idDelete);
            $("#includedContent").load("/Laboratorio/eliminarpaciente", {id: idDelete});
//               alert( $(".selected").html());
        });
    });
</script>

</body>

</html>
