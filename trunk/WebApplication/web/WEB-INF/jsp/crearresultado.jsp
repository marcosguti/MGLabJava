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
        #dataTables-example_paginate{
            visibility: hidden;
        }
    .bs-example{
    	margin: 20px;
    }
	/* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
    .form-horizontal .control-label{
        padding-top: 7px;
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
                                                                <button id="${ob.id}" type="button" class="btn btn-outline btn-primary btn-md btn-block"><c:out value="${ob.nombre}"/></button>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <button id="addRow" type="button" class="btn btn-primary btn-md btn-block">add</button>


                                        </div>
                                    </div>
                                    <!-- .panel-body -->
                                </div>
                                <div class="panel panel-primary panelBorderColor">


                                    <div class="panel-heading panelHeaderColor">
                                        Pacientes
                                    </div>
                                    <div class="panel-body center">
                                        <div class="dataTable_wrapper">
                                            <table class="table table-striped table-bordered table-hover" width="100%" id="dataTables-example">
                                                <thead id="tablaPacientesHead">
                                                    <tr>
                                                        <th>Nombre</th>
                                                        <th>Cedula</th>

                                                        <th>ID</th>
                                                        <th style="text-align: center;"></th>
                                                    </tr>
                                                </thead>
<!--                                                <h1><c:out value="${mapPacientes['22'].nombres}"/></h1>-->
                                                <tbody>  <c:forEach var="ob" varStatus="status" items="${mapPacientes}">
                                                        <tr class="odd gradeX">
                                                            <td><c:out value="${ob.value.nombres}"/></td>
                                                            <td><c:out value="${ob.value.cedula}"/></td>

                                                            <td><c:out value="${ob.value.id}"/></td>
                                                            <td style="text-align: center;"><div class="btn-group" role="group" aria-label="...">
                                                                    <button type="button" class="btn btn-info btn-circle"><i class="fa fa-check"></i>
                                                                    </button>

                                                                </div></td>
                                                        </tr>

                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>

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
                                                
                                            </div>
                                        </div>
                                        <div class="panel panel-primary panelBorderColor "> 
                                            <div class="panel-heading panelHeaderColor">
                                                Datos de las Pruebas
                                              
                                            </div>
                                            <div class="panel-body center" id ="datosResultado">
                                                 <div class="dataTable_wrapper">
                                            <table class="table table-striped table-bordered table-hover" width="100%" id="tablaResultados">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <!--<th>Cedula</th>-->

                                                        <!--<th>ID</th>-->
                                                        <th style="text-align: center;"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>  
                                                </tbody>
                                            </table>
                                        </div>
                                            </div>
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
//        $("#dataTables-example_length, #dataTables-example_info, #dataTables-example_paginate, #tablaResultados_info, #tablaResultados_paginate, #tablaResultados_filter, #tablaResultados_length").remove();
//        var table = $('#dataTables-example').dataTable();
//    var tableTools = new $.fn.dataTable.TableTools( table, {
//        "buttons": [
//            "copy",
//            "csv",
//            "xls",
//            "pdf",
//            { "type": "print", "buttonText": "Print me!" }
//        ]
//    } );
//      
//    $( tableTools.fnContainer() ).insertAfter('div.info');
   
       var tt =  $('#dataTables-example').DataTable({
//            "dom": '<"top"f><"clear">',
//           "dom": 'T<"clear">frt',
           "dom":'<"pull-left"f>t',
//        "tableTools": {
//            "sSwfPath": "/swf/copy_csv_xls_pdf.swf"
//        },
//            "sDom": '<"H"lr>t<"F"ip>' ,
//              "paging":   false,
               "pageLength": 1,
//            "bLengthChange": false,
            "ordering": false,
            
//            "info": false,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"
            }, "scrollX": true, 
//            "lengthMenu": [1]
        });
             $('#dataTables-example tbody ').on('click', 'tr', function () {
                var data = tt.row(this).data();
                var fecha= new Date();
//                fecha   .toLocaleFormat('%d-%b-%Y');
//                $( "#datosPaciente" ).append( "<label>Nombre: </label><p>"+data[0]+"</p>" );
//"<div class=\"form-group\"><label>Nombre:</label><p class=\"form-control-static\">"+data[0]+"</p></div>"
                 $( "#datosPaciente" ).append("<div class=\"form-group\"><label class=\"control-label\">Nombre: </label><input type=\"text\" class=\"form-control\" placeholder=\"Disabled input\" disabled=\"disabled\" value=\""+data[0]+"\"></div><div class=\"form-group\"<label>  Cedula: </label><p class=\"form-control-static\">"+data[1]+"</p></div>" );
//                                     $( "#datosPaciente" ).append("<div class=\"form-group\"><label class=\"control-label col-xs-2\">Email</label> <div class=\"col-xs-10\"> <p class=\"form-control-static\">harrypotter@mail.com</p> </div></div>" );
         
//             " <h1><c:out value="${mapPacientes['22'].nombres}"/></h1>"
//                alert('Paciente: ' + data[1]);
            });
        
        $('#tablaResultados').DataTable({
            
            "paging": false,
            "ordering": false,
            "info": false,
            "searching": false,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"
            }, "scrollX": true,
        });
        var t = $('#tablaResultados').DataTable();
        var counter = 1;

        $('#addRow').on('click', function () {
            t.row.add([
                counter + '.1',
                counter + '.2'
            ]).draw(false);

            counter++;
        });

        // Automatically add a first row of data
//        $('#addRow').click();
    });
</script>

</body>

</html>
