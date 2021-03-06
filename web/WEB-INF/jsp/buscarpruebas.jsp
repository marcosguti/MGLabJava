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
                        Pruebas
                    </div>
                    <div class="panel-body center-block">
                        <div class="dataTable_wrapper" >
                            <table class="table table-striped table-bordered table-hover " id="dataTables-example">
                                <thead>
                                    <tr>
                                         <th>Grupo</th>
                                        <th>Nombre</th>
                                       
                                        <th>Unidad</th>
                                        <th>Limites</th>
                                        <th>Precio</th>
                                       
                                    </tr>
                                </thead>
                                <tbody>  <c:forEach var="ob" varStatus="status" items="${pruebas}">
                                        <tr class="odd gradeX">
                                            <td><c:out value="${ob.grupoPruebas.nombre}"/></td>
                                            <td><c:out value="${ob.nombre}"/></td>
                                            
                                            <td><c:out value="${ob.unidad}"/></td>
                                            <td><c:out value="${ob.limites}"/></td>
                                            <td><c:out value="${ob.precio}"/></td>
                                         
                                        </tr>

                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div class="panel-body center-block">
                        <!--<div class="bs-example">--> 
                        <!--<button type="submit" class="btn btn-default">Guardar</button>-->
                        <button type="reset" class="btn btn-default">Imprimir</button>
                        <button type="button" class="btn btn-danger " id="buttonBorrarPrueba" disabled="disabled">Borrar</button>
                        <!--</div>-->
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
//            $('#dataTables-example tbody ').on('click', 'tr', function () {
//                var data = table.row(this).data();
//                alert('Paciente: ' + data[1]);
//            });
            var table = $('#dataTables-example').DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"
                },
                "lengthMenu": [,10,15,20,30,50,100],
                        "columnDefs": [
                            {"visible": false, "targets": 0},{targets: "_all",orderable: false}
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
                                    '<tr class="group"><td colspan="5" role="row">' + group + '</td></tr>'
                                    );

                            last = group;
                        }
                    });
                }
            });
            
             var t = $('#dataTables-example').DataTable();
            $('#dataTables-example tbody').on('click', 'tr', function () {
                //        alert( 'You clicked on '+name+'\'s row' );
                //            alert("hola");td:nth-child(3)
                //            $(this).toggleClass('selected');
//                                                                    alert($(this).children().length);
//                if ($(this).children().length > 1) {

                    if ($(this).hasClass('selected')) {
                        
                        $(this).removeClass('selected');
//                        $('#borrar').attr('disabled', 'disabled');
//                        $('#ver').attr('disabled', 'disabled');
                    } else {
//                        alert(t.$('tr.selecte').text());
                        t.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
//                        $('#borrar').removeAttr('disabled');
//                        $('#ver').removeAttr('disabled');
                    }
//                }
                //             prueba = $('td', this).eq(0).text();

            });
            
            
        });
    </script>

</body>

</html>
