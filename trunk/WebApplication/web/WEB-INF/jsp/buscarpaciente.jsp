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
        /*        table{
                   border-collapse: collapse;
            border-radius: 30px;
            border-style: hidden;  hide standard table (collapsed) border 
            box-shadow: 0 0 0 1px #666;  this draws the table border   
                }*/
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
                                        <!--<div class="row">-->
                                        <!--<div class="col-lg-6 ">-->
                                        <button id="guardar" type="submit" class="btn btn-primary">Guardar</button>
                                        <button type="reset" class="btn btn-primary">Reestablecer</button>
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
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                <button type="submit" class="btn btn-primary" id="confirmarBorrar" data-dismiss="modal">Si</button>
                            </div>
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
//        var ff='avecesssssssss';
//        function sub(cad,i,f) {
//            
//             cad=cad.substring(1, 4);
////            alert(cad);
//        }
//        split(ff);
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
            $("#includedContent").load("/Laboratorio/eliminarpaciente", {id: idDelete}, function () {
//                customAlert("Se borro");
            });
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
//        $('#guardar').on('click', function () {
////                var idDelete=$(".selected>td:last-child").text();
////                alert(idDelete);
////                var nombre= $("#includedContent")
////            var ID = $("#id").val();
//            $("#includedContent").load("/Laboratorio/modificarpaciente",{
//                    nombre: $("#nombre").val(),
//                    tipoDoc: $("#tipoDoc").val(),
//                    documento: $("#documento").val(),
//                    edad: $("#edad").val(),
//                    sexo: $("#sexo").val(),
//                    telefono: $("#telefono").val(),
//
//                id: $("#sexo").val()
//            });
//////               alert( $(".selected").html());
//        });
//        $('td:nth-child(1)').on('click', function () { 
//            alert($(this).text());
//        });
//        
//        $('#guardar').on('click', function () {
//            $.ajax({
//                url: '/Laboratorio/modificarpaciente',
//                type: 'post',
//                dataType: 'json',
//                data: $('#form').serialize()
//               
//            });
//        });
//        
//        $('#form').submit(function (  ) {
//            alert("submit");
//            $("#includedContent").load("/Laboratorio/modificarpaciente");
//        });
    });
</script>

</body>

</html>
