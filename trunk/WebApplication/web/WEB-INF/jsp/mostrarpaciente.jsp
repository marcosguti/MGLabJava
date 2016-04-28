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

</head>

<body>
    
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-8">
                    <div class="form-group">
                        <label for="disabledSelect">Nombre</label>
                        <input class="form-control input-sm" value="${paciente.nombres}"  type="text" disabled="">
                    </div>
                </div>
                <div class="col-lg-3">

                    <div class="form-group">
                        <label for="disabledSelect">Fecha</label>
                        <input class="form-control input-sm" id="fecha"  type="text" disabled="">
                    </div>
                </div>
            </div>
            <!-- /.col-lg-6 (nested) -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-4 ">
                    <div class="col-lg-5 col-lg-pull-1">

                        <div class="form-group">
                            <label for="disabledSelect">Edad</label>
                            <input class="form-control input-sm" value="${paciente.edad}"  type="text" disabled="">
                        </div>
                    </div>
                    <div class="col-lg-5 .col-lg-offset-3  ">

                        <div class="form-group">
                            <label for="disabledSelect">Sexo:</label>
                            <input class="form-control input-sm" value="${paciente.sexo}"  type="text" disabled="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 ">

                    <div class="form-group">
                        <label for="disabledSelect">Cedula:</label>
                        <input class="form-control input-sm" value="${paciente.cedula}"  type="text" disabled="">
                    </div>
                </div>
                <div class="col-lg-3 ">

                    <div class="form-group">
                        <label for="disabledSelect">ID:</label>
                        <input class="form-control input-sm" value="${paciente.id}" id="pacienteId" type="text" disabled="">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-8 ">

                    <div class="form-group">
                        <label for="disabledSelect">Direccion:</label>
                        <input class="form-control input-sm" value="${paciente.direccion}"  type="text" disabled="">
                    </div>
                </div>
                <div class="col-lg-3 ">

                    <div class="form-group">
                        <label for="disabledSelect">Telefono:</label>
                        <input class="form-control input-sm"  value="${paciente.telefono}" type="text" disabled="">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-8">
                    <div class="form-group">
                        <input class="form-control input-sm" type="text" placeholder="Observaciones" id="observaciones" >
                    </div>
                </div>

            </div>
            <!-- /.col-lg-6 (nested) -->
        </div>
        <!-- /.row (nested) -->
   

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
//            alert("hola");
        var date=new Date();
        var fecha=date.getDate()+"/"+date.getMonth()+"/"+date.getFullYear();
            $("#fecha").val(fecha );
        });
    </script>

</body>

</html>
