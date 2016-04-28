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
    <!-- Mi CSS -->
    <link href="<c:url value='/resources/marco/common.css' />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value='/resources/bower_components/font-awesome/css/font-awesome.min.css' />" rel="stylesheet" type="text/css">
    <title>JSP Page</title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        #tablaPaciente_paginate{
            visibility: hidden;
        }
        .bs-example{
            margin: 20px;
        }
        /* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
        .form-horizontal .control-label{
            padding-top: 7px;
        }
        .selected{
            background-color: #337ab7 !important;
            color: white;
        }
        th.sorting::after{
            display:none;
        }
    </style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->

        <div class="row">
            <!--<div id="page-wrapper">-->

            <!--<div class="container">-->
            <div class="col-lg-12 ">
                <div class="panel panel-primary panelBorderColor">

                    <!--/.panel-heading--> 
                    <div class="panel-heading panelHeaderColor">
                        Crear Resultado
                    </div>
                    <div class="panel-body center">

                        <div class="row">
                            <div class="col-lg-4">
                                <div class="panel panel-primary panelBorderColor">


                                    <div class="panel-heading panelHeaderColor">
                                        Pacientes
                                    </div>
                                    <div class="panel-body center">
                                        <div class="dataTable_wrapper">
                                            <table  style="font-size: 11px;" class="table table-striped table-bordered table-hover" width="100%" id="tablaPaciente">
                                                <thead  style=" text-align: center" id="tablaPacientesHead">
                                                <strong> 
                                                    <tr >
                                                        <th>Nombre</th>
                                                        <th>Cedula</th>
                                                        <th>ID</th>
                                                        <!--<th ></th>-->
                                                    </tr>
                                                    <strong>
                                                        </thead>
        <!--                                                <h1><c:out value="${mapPacientes['22'].nombres}"/></h1>-->
                                                        <tbody style="cursor:pointer; text-align:center" >  <c:forEach var="ob" varStatus="status" items="${mapPacientes}">
                                                            <strong> <tr class="odd gradeX" title="Click Para Seleccionar El Paciente"> 

                                                                    <td><c:out value="${ob.value.nombres}"/></td>
                                                                    <td><c:out value="${ob.value.cedula}"/></td>

                                                                    <td><c:out value="${ob.value.id}"/></td>
                                                                </tr>                                                         
                                                            </strong>


                                                        </c:forEach>
                                                        </tbody>
                                                        </table>
                                                        </div>

                                                        </div>

                                                        </div>
                                                        <div class="panel panel-primary panelBorderColor ">
                                                            <div class="panel-heading panelHeaderColor">
                                                                Pruebas
                                                            </div>
                                                            <!-- .panel-heading -->
                                                            <div class="panel-body">

                                                                <div class="panel-group" id="accordion">
                                                                    <c:forEach var="grupo" varStatus="status" items="${treePruebas}">
                                                                        <div class="panel panel-primary">
                                                                            <div class="panel-heading panelHeaderColor">
                                                                                <h4 class="panel-title">
                                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#${grupo.key}" aria-expanded="false" class="collapsed"><c:out value="${grupo.key}"/></a>
                                                                                </h4>
                                                                            </div>
                                                                            <div id="${grupo.key}" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                                                                <div class="panel-body">
                                                                                    <c:forEach var="ob" varStatus="status" items="${grupo.value}">
                                                                                        <button id="${ob.id}" data-nombre="${ob.nombre}" data-grupo="${ob.grupoPruebas.nombre}"  data-unidad="${ob.unidad}"  data-precio="${ob.precio}" type="button" class="btn btn-outline btn-primary btn-md btn-block addRow"><c:out value="${ob.nombre}"/></button>
                                                                                    </c:forEach>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                            <!-- .panel-body -->
                                                        </div>


                                                        <!-- /.panel -->
                                                        </div> 
                                                        <div class="col-lg-8">
                                                            <div class="panel panel-primary panelBorderColor">

                                                                <!--<input type="text" value="un \"gran\" hombre" />-->
                                                                <div class="panel-heading panelHeaderColor">
                                                                    Resultado
                                                                </div>
                                                                <div class="panel-body center">
                                                                    <div class="panel panel-primary panelBorderColor "> 
                                                                        <div class="panel-heading panelHeaderColor">
                                                                            Datos del Paciente

                                                                        </div>
                                                                        <div class="panel-body center" id ="datosPaciente">
                                                                            <p>No Hay Datos</p>  
                                                                        </div>
                                                                    </div>
                                                                    <div class="panel panel-primary panelBorderColor "> 
                                                                        <div class="panel-heading panelHeaderColor">
                                                                            Datos de las Pruebas

                                                                        </div>
                                                                        <div class="panel-body center" id ="datosResultado">
                                                                            <div class="panel-group">
                                                                                <div class="dataTable_wrapper">

                                                                                    <table class="table  table-bordered " width="100%" id="tablaResultados">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th>Grupo</th>
                                                                                                <th>Prueba</th>
                                                                                                <th>Valor</th>
                                                                                                <th>limites</th>
                                                                                                <!--<th>Cedula</th>-->

                                                                                                <!--<th>ID</th>-->
                                                                                                <!--<th style="text-align: center;"></th>-->
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody> 

                                                                                        </tbody>
                                                                                    </table>
                                                                                </div><br>

                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-2 col-lg-offset-10">
                                                                                    <label for="disabledSelect">Precio</label>
                                                                                    <input class="form-control input-sm"  id="precio" type="text" disabled="">
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <div class="panel-body center-block">
                                                                        <!--<div class="bs-example">--> 
                                                                        <button type="submit" class="btn btn-default" id="buttonGuardar" disabled="disabled">Guardar</button>
                                                                        <button type="reset" class="btn btn-default" disabled="disabled">Imprimir</button>
                                                                        <button type="button" class="btn btn-danger " id="buttonBorrarPrueba" disabled="disabled">Borrar Prueba</button>
                                                                        <!--</div>-->
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div></div>
                                                        <!-- /.col-lg-12 -->
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
                                                                var pacienteSelected = false;

                                                                var precio = 0;
                                                                var prueba;
                                                                var tt = $('#tablaPaciente').DataTable({
                                                                    //            "dom": '<"top"f><"clear">',
                                                                    "dom": '<"pull-left"f>t',
                                                                    "order": [[0, "asc"]],
                                                                    "pageLength": 1,
                                                                    "ordering": false,
                                                                    "language": {
                                                                        "url": "<c:url value='/resources/DataTablesSpanish.json' />"
                                                                    },
                                                                    "scrollX": true,
                                                                });
//                                                                var tt = $('#tablaPaciente').DataTable();
                                                                $('#tablaPaciente tbody ').on('click', 'tr', function () {

                                                                    var data = tt.row(this).data();
                                                                    if ($(this).hasClass('selected')) {
                                                                        $(this).removeClass('selected');
                                                                        $(this).attr('title', 'Click Para Seleccionar El Paciente');
                                                                        $("#buttonGuardar").attr('disabled', 'disabled');
                                                                        $("#datosPaciente").empty();
                                                                        $("#datosPaciente").append("<p>No Hay Datos</p>");
                                                                        pacienteSelected = false;
                                                                    } else {
                                                                        tt.$('tr.selected').removeClass('selected');
                                                                        $(this).addClass('selected');
                                                                        $(this).attr('title', 'Click Para Quitar El Paciente');
                                                                        $("#datosPaciente").empty();
                                                                        var id = data[2];
//                                                                        $("#datosPaciente").append("<div class=\"form-group\"><label class=\"control-label\">Nombre: </label><input type=\"text\" class=\"form-control\" placeholder=\"Disabled input\" disabled=\"disabled\" value=\"" + data[0] + "\"></div><div class=\"form-group\"<label>  Cedula: </label><p class=\"form-control-static\">" + data[1] + "</p></div>");
                                                                        $("#datosPaciente").load("/Laboratorio/mostrarpaciente", {id: data[2]}).animate({left: '250px'});
                                                                        pacienteSelected = true;
                                                                        if (t.data().length > 0)
                                                                            $('#buttonGuardar').removeAttr('disabled');
                                                                    }
//                                                                   
                                                                    var fecha = new Date();
                                                                    //                fecha   .toLocaleFormat('%d-%b-%Y');
                                                                    //                $( "#datosPaciente" ).append( "<label>Nombre: </label><p>"+data[0]+"</p>" );
                                                                    //"<div class=\"form-group\"><label>Nombre:</label><p class=\"form-control-static\">"+data[0]+"</p></div>"
                                                                    //                                     $( "#datosPaciente" ).append("<div class=\"form-group\"><label class=\"control-label col-xs-2\">Email</label> <div class=\"col-xs-10\"> <p class=\"form-control-static\">harrypotter@mail.com</p> </div></div>" );

                                                                    //             " <h1><c:out value="${mapPacientes['22'].nombres}"/></h1>"
                                                                    //                alert('Paciente: ' + data[1]);
                                                                });
                                                                var t = $('#tablaResultados').DataTable({
                                                                    "dom": 'rt',
//                                                                    "ordering": false,
                                                                    "order": [[0, 'asc']],
//                                                                    "orderFixed": {
//                                                                    "pre": [ 0, 'asc' ]
//                                                                    }
                                                                    "columnDefs": [{targets: "_all", orderable: false},
                                                                        {"visible": false, "targets": 0}
                                                                    ],
                                                                    "language": {
                                                                        "url": "<c:url value='/resources/DataTablesSpanish.json' />"
                                                                    }, "scrollX": true,
                                                                    "drawCallback": function (settings) {
                                                                        var api = this.api();
                                                                        var rows = api.rows({page: 'current'}).nodes();
                                                                        var last = null;
                                                                        api.column(0, {page: 'current'}).data().each(function (group, i) {
                                                                            if (last !== group) {
                                                                                $(rows).eq(i).before(
                                                                                        '<tr class="group"  style="font-size: 16px;background-color: #337ab7"><td colspan="5">Area De ' + group + '</td></tr>'
                                                                                        );
                                                                                last = group;
                                                                            }
                                                                        });
                                                                    }
                                                                });
//                                                        
                                                                $('.addRow').on('click', function () {
                                                                    var valor = $(this);
                                                                    var rowNode = t.row.add([
                                                                        valor.attr("data-grupo"), valor.attr("data-nombre"),
                                                                        "<input type=\"text\"  class=\"form-control\" name=\"name\" onkeypress=\'return ((event.charCode >= 48 && event.charCode <= 57)||event.charCode==44||event.charCode==46||event.charCode==0)\' maxlength=\"10\" title=\"Introduzca el Valor del Resultado\" id=\"inputSuccess\" required>", valor.attr("data-unidad")
                                                                    ]).draw(false).draw().node();
                                                                    $(rowNode).attr('data-id', valor.attr("id"));

                                                                    if (t.data().length > 0 && pacienteSelected == true)
                                                                        $('#buttonGuardar').removeAttr('disabled');

                                                                    $(rowNode).attr('data-precio', valor.attr("data-precio"));
                                                                    precio += +$(rowNode).attr('data-precio');
                                                                    $('#precio').attr('value', precio + " Bs.");
                                                                    $(rowNode).css('cursor', 'pointer');
                                                                    $(this).attr('disabled', 'disabled');
                                                                });
                                                                $('#tablaResultados tbody').on('click', 'tr', function () {

                                                                    if ($(this).children().length > 1) {
                                                                        if ($(this).hasClass('selected')) {
                                                                            $(this).removeClass('selected');
                                                                            $('#buttonBorrarPrueba').attr('disabled', 'disabled');
                                                                        } else {
                                                                            t.$('tr.selected').removeClass('selected');
                                                                            $(this).addClass('selected');
                                                                            $('#buttonBorrarPrueba').removeAttr('disabled');
                                                                        }
                                                                    }
                                                                    prueba = $(this).attr('data-id');
                                                                });
                                                                $('#buttonBorrarPrueba').click(function () {
                                                                    $('#' + prueba).removeAttr('disabled');
                                                                    precio = precio - $('#' + prueba).attr('data-precio');
                                                                    $('#precio').attr('value', precio + " Bs.");
                                                                    t.row('.selected').remove().draw(false);
                                                                    $('#buttonBorrarPrueba').attr('disabled', 'disabled');
                                                                    if (t.data().length > 0 && pacienteSelected == true)
                                                                        $('#buttonGuardar').removeAttr('disabled');
                                                                    else
                                                                        $('#buttonGuardar').attr('disabled', 'disabled');
                                                                });
//                                                                 $("#observaciones").on('keyup',function () {
//                                                                        alert($(this).val());
//                                                                    });
//                                                                var rows = $('#tablaResultados').dataTable().fnGetNodes();
                                                                $('#buttonGuardar').click(function () {
                                                                    alert($("#pacienteId").attr('value'));

                                                                    alert($("#observaciones").val());
//                                                                    var data = t.rows().data();
//                                                                    data.each(function (value, index) {
//                                                                        alert('Data in index: ' + index + ' is: ' + value);
//                                                                    });
                                                                    t.rows().iterator('row', function (context, index) {
                                                                        alert($(this.row(index).node()).attr('data-id'));
                                                                        
                                                                    });
//                                                                    var rows = t.rows(0).cells[0].value;
//                                                                    var rows = t.rows(0).data();
//                                                                    console.log(rows);
//                                                                    alert((rows[0][2]));
                                                                    alert(rows);
                                                                    var cells = [];
//                                                                    for (var i = 0; i < rows.length; i++)
//                                                                    {
//                                                                        // Get HTML of 3rd column (for example)
//                                                                        cells.push($(rows[i]).find("td:eq(1)").html());
//                                                                        alert("cells[i]");
//                                                                    }
//                                                                    console.log($("input#observaciones").attr('value'));                                                                    
//                                                                    if (pacienteSelected == true && t.data().length > 0) {
//                                                                        alert("fino");
//                                                                    } else {
//
//                                                                    }

                                                                });
                                                            });
                                                        </script>

                                                        </body>

                                                        </html>

