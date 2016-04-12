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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>


    </script>
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
        /*        .gradeX{
                    cursor:pointer;
                }*/
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
            <div class="col-lg-11 ">
                <div class="panel panel-primary">

                    <!--/.panel-heading--> 
                    <div class="panel-heading">
                        Resultados
                    </div>
                    <div class="panel-body center-block">
                        <div class="dataTable_wrapper" >
                            <table class="table table-striped table-bordered table-hover " id="tablaResultados">
                                <thead>
                                    <tr>
                                        <th>Fecha</th>
                                        <th>Nombre</th>
                                        <th>Cedula</th>
                                        <th>Precio</th>
                                        <th>Observaciones</th>
                                        <th>N°</th>
                                    </tr>
                                </thead>
                                <tbody>  <c:forEach var="ob" varStatus="status" items="${resultados}">
                                        <tr class="odd gradeX">
                                            <td><c:out value="${ob.fecha}"/></td>
                                            <td value="${ob.paciente.id}"><c:out value="${ob.paciente.nombres}"/></td>
                                            <td><c:out value="${ob.paciente.cedula}"/></td>
                                            <td><c:out value="${ob.precio}"/></td>
                                            <td><c:out value="${ob.observaciones}"/></td>
                                            <td><c:out value="${ob.id}"/></td>

                                        </tr>

                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div class="panel-body center-block">
                        <!--<form action="${pageContext.request.contextPath}/viewReporte">-->
                        <button id="imprimir" value="${pageContext.request.contextPath}/viewReporte" type="submit" class="btn btn-default">Imprimir</button>
                        <button type="button" class="btn btn-danger " id="buttonBorrarResultado" disabled="disabled" data-toggle="modal" data-target ="#myModal">Borrar</button>

                        <!--</form>-->

                        <!--<div class="bs-example">--> 
                        <!--<button type="submit" class="btn btn-default">Guardar</button>-->

                        <!--<button type="button"class="btn btn-primary" data-toggle="modal" data-target ="#myModal">Guardar</button>-->
                        <!--</div>-->
                    </div>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Resultado</h4>
                                </div>
                                <div class="modal-body">
                                    Desea Borrar El Resultado?    
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
//            $( "th").unbind( "click" );
        $("th.sorting::after").remove();
//            $('#dataTables-example').DataTable({
//                responsive: true, "lengthMenu": [5, 10, 15, 20, 50, 100],
//                "language": {
//                    "lengthMenu": "Mostrando _MENU_ Elementos por pagina",
//                    "zeroRecords": "Nothing found - sorry",
//                    "info": "Mostrando pagina _PAGE_ de _PAGES_",
//                    "search": "Buscar:",
//                    "infoEmpty": "No records available", "paginate": {
//                        "first": "First",
//                        "last": "Last",
//                        "next": "Sig",
//                        "previous": "Ant"
//                    },
//                    "infoFiltered": "(filtered from _MAX_ total records)",
//
//                       "language": {
//                    "url": "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"
//                
//                }
//            });
//            var table = $('#dataTables-example').DataTable();
//
//            $('#tablaResultados tbody ').on('click', 'tr', function () {
//                var data = table.row(this).data();
//                alert('Paciente: ' + data[1]);
//            });
                var table = $('#tablaResultados').DataTable({
        responsive: true, responsive: true, "lengthMenu": [5, 10, 15, 20, 50, 100],
                "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"
                },
                "lengthMenu": [1, 100],
                "columnDefs": [
                {"visible": false, "targets": 0}
                ],
                "order": [[0, 'asc']],
                "displayLength": 25,
                "drawCallback": function (settings) {
                var api = this.api();
                        var rows = api.rows({page: 'current'}).nodes();
                        var last = null;
                        api.column(0, {page: 'current'}).data().each(function (group, i) {
                if (last !== group) {
                $(rows).eq(i).before(
                        '<tr class="group"><td colspan="5">' + group + '</td></tr>'
                        );
                        last = group;
                }
                });
                }
        });
                var t = $('#tablaResultados').DataTable();
                $('#tablaResultados tbody').on('click', 'tr', function () {

        //        alert( 'You clicked on '+name+'\'s row' );
        //            alert("hola");td:nth-child(3)
        //            $(this).toggleClass('selected');
//                                                                    alert($(this).children().length);
        if ($(this).children().length > 1) {
        if ($(this).hasClass('selected')) {
        $(this).removeClass('selected');
                $('#buttonBorrarResultado').attr('disabled', 'disabled');
        } else {
        t.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
                $('#buttonBorrarResultado').removeAttr('disabled');
        }
        }
        //             prueba = $('td', this).eq(0).text();

        });
//            buttonBorrarResultado
                $('#confirmarBorrar').on('click', function () {
        var idDelete = $(".selected>td:last-child").text();
                alert(idDelete);
                $("#includedContent").load("/Laboratorio/eliminarresultado", {id: idDelete});
//               alert( $(".selected").html());
        });
//            $( 'thead').unbind( "click" );
//            $('thead').off('click');
                $('thead').on('click', function () {
        $(this).removeAttr('class');
//                $(this).off('click');
//                var idDelete=$(".selected>td:last-child").text();
                alert("THEAD");
//                $("#includedContent").load("/Laboratorio/eliminarresultado", {id: idDelete});
//               alert( $(".selected").html());
        });
                $('#imprimir').on('click', function () {
//                $(this).removeAttr('class');
////                $(this).off('click');
////                var idDelete=$(".selected>td:last-child").text();
//                alert("THEAD");
        var datos = [];
//        var i=0;
//         var a= $('.selected td:nth-child(1)').text();
//         alert(a);
                $(".selected td").each(function () {
//                alert($(this).text());
                if ($(this).index == 1)
                    datos.push($(this).val());
                if ($(this).index == 4)
                    datos.push($(this).text());
                if ($(this).index == 5)
                    datos.push($(this).text());
            });
                $("#includedContent").load($('#imprimir').val(), {
                idPaciente: datos [0],
                idResultado: datos [5],
                observaciones: datos [4]
               
        });
        });
    </script>

</body>

</html>
