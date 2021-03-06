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
        .vertical-alignment-helper {
            display:table;
            height: 100%;
            width: 100%;
            pointer-events:none;
        }
        .vertical-align-center {
            /* To center vertically */
            display: table-cell;
            vertical-align: middle;
            pointer-events:none;
        }
        .modal-content {
            /* Bootstrap sets the size of the modal in the modal-dialog class, we need to inherit it */
            width:inherit;
            height:inherit;
            /* To center horizontally */
            margin: 0 auto;
            pointer-events:all;
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
                                        <th>Paciente</th>
                                        <th>IDPaciente</th>
                                        <th>Cedula</th>
                                        <th>Precio</th>
                                        <th>Observaciones</th>
                                        <th>N°</th>
                                    </tr>
                                </thead>
                                <tbody>  <c:forEach var="ob" varStatus="status" items="${resultados}">
                                        <tr class="odd gradeX">
                                            <td><c:out value="${ob.fecha}"/></td>
                                            <td><c:out value="${ob.paciente.nombres}"/></td>
                                            <td><c:out value="${ob.paciente.id}"/></td>
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
                        <button id="ver" value="${pageContext.request.contextPath}/viewReporte"  disabled="disabled" type="submit" class="btn btn-default">Ver</button>
                        <button type="button" class="btn btn-danger " id="borrar" disabled="disabled" data-toggle="modal" data-target ="#myModal">Borrar</button>
                    </div>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="vertical-alignment-helper">
                        <div class="modal-dialog vertical-align-center" role="document">
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
                        </div></div>
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
//            $('th').on('click', function (e) {
//                e.stopPropagation();
//            });


            var table = $('#tablaResultados').DataTable({
                responsive: true, responsive: true, "lengthMenu": [5, 10, 15, 20, 50, 100],
                "language": {
                    "url": "// .datatables.net/plug-ins/1.10.11/i18n/Spanish.json"
                },
                "lengthMenu": [1, 100],
//                        "columnDefs": [
//                            {"visible": false, "targets": 0}
//                        ],
                "order": [[0, 'asc']],
                columnDefs: [{
                        targets: "_all",
                        orderable: false
                    },{"visible": false, "targets": 0}],
                        "displayLength": 25,
                "drawCallback": function (settings) {
                    var api = this.api();
                    var rows = api.rows({page: 'current'}).nodes();
                    var last = null;
                    api.column(0, {page: 'current'}).data().each(function (group, i) {
                        if (last !== group) {
                            $(rows).eq(i).before(
                                    '<tr class="group"><td colspan="6"><a href="#" class="btn btn-primary btn-xs disabled" role="button">' + group.substring(0,10) + '</a></td></tr>'
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
                        $('#borrar').attr('disabled', 'disabled');
                        $('#ver').attr('disabled', 'disabled');
                    } else {
                        t.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                        $('#borrar').removeAttr('disabled');
                        $('#ver').removeAttr('disabled');
                    }
                }


            });
//            borrar



            $('#confirmarBorrar').on('click', function () {
                var idDelete = $(".selected>td:last-child").text();
                $("#includedContent").load("/Laboratorio/eliminarresultado", {id: idDelete});
            });



            $('#ver').on('click', function () {

                var idr ;
                $(".selected td").each(function () {
//                alert($(this).text());
                    if($(this).index()==5) {
                           idr=$(this).text();
                    }
                });
               
//                document.location.href = "${pageContext.request.contextPath}/viewReporte?idResultado="+idr+"&idPaciente="+idp+"?type=individual";
                window.open("${pageContext.request.contextPath}/viewReporte?idResultado=" + idr , '_blank');
////alert(datos);
//                    var pet = $("p").text();
//                    alert(pet);
//                    
//                    var meth = "POST";
////                    alert(meth);
//                    var idp=datos[0].toString();
//                    var idr=datos[2].toString();
//                    alert(idp+"----"+idr+"----"+pet+"---");
//                    $.ajax({
//                        beforeSend: function () {
////                            $('#status').spin({radius: 3, width: 2, height: 2, length: 4})
////                            id = document.form.id.value;
//                        },
//                        url: 'viewReporte',
//                        type: meth,
//                        //data: $('#main form').serialze()
//                        data: {
//                            idPaciente: idp,
//                            idResultado: idr
//                        },
//                        success: function (resp) {
////                            $('#status').html('<img src="ok.jpg"/>')
//                            console.log(resp)
//                        },
//                        error: function (jqXHR, estado, error) {
//                            $('#status').html('<img src="x.jpg"/>')
//                            console.log(estado)
//                            console.log(error)
//                        },
//                        complete: function (jqXHR, estado) {
//                            console.log()
//                        },
//                        timeout: 10000
            });




//        if ($(this).index() === 1) {
//        datos.push($(this).val());
////                     alert($(this).val());
////                     alert($(this).index());
////                     alert($(this).text());
//        }
//        if ($(this).index()) == 4) {
//        datos.push($(this).text());
////                     alert($(this).text());
//        }
//        if ($(this).index()) == 5) {
//        datos.push($(this).text());
////                     alert($(this).text());
//        }
//                });
//            alert(datos[1]);
//                $("#includedContent").load($('#ver').val(), {
//                idPaciente: datos [1],
//                idResultado: datos [5],
//                observaciones: datos [4]})
//            });
            $('thead').on('click', function () {
//                alert($('#ver').val());
//                $(this).removeAttr('class');
//                $(this).off('click');
//                var idDelete=$(".selected>td:last-child").text();
//                alert("THEAD");
//                $("#includedContent").load("/Laboratorio/eliminarresultado", {id: idDelete});
//               alert( $(".selected").html());
            });



        });
    </script>

</body>

</html>
