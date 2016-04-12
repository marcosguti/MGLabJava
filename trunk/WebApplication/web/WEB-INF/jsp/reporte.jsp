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
        <script src="<c:url value='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js' />"></script>
   <!--<script src="<c:url value='/resources/marco/marco.js' />"></script>-->
        <!-- MetisMenu CSS -->
        <link href="<c:url value='/resources/bower_components/metisMenu/dist/metisMenu.min.css' />" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="<c:url value='/resources/dist/css/timeline.css' />" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="<c:url value='/resources/dist/css/sb-admin-2.css' />" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="<c:url value='/resources/bower_components/morrisjs/morris.css' />" rel="stylesheet">
        <!-- DataTables CSS -->
        <link href="<c:url value='/resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css' />" rel="stylesheet">

        <!-- DataTables Responsive CSS -->
        <link href="<c:url value='/resources/bower_components/datatables-responsive/css/dataTables.responsive.css' />" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="<c:url value='/resources/bower_components/font-awesome/css/font-awesome.min.css' />" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
        <style>


        </style>
        <script>
            function demoFromHTML() {
                var pdf = new jsPDF('p', 'pt', 'letter');
                // source can be HTML-formatted string, or a reference
                // to an actual DOM element from which the text will be scraped.
                source = $('#content')[0];

                // we support special element handlers. Register them with jQuery-style 
                // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
                // There is no support for any other type of selectors 
                // (class, of compound) at this time.
                specialElementHandlers = {
                    // element with id of "bypass" - jQuery style selector
                    '#bypassme': function (element, renderer) {
                        // true = "handled elsewhere, bypass text extraction"
                        return true
                    }
                };
                margins = {
                    top: 80,
                    bottom: 60,
                    left: 40,
                    width: 522
                };
                // all coords and widths are in jsPDF instance's declared units
                // 'inches' in this case
                pdf.fromHTML(
                        source, // HTML string or DOM elem ref.
                        margins.left, // x coord
                        margins.top, {// y coord
                            'width': margins.width, // max width of content on PDF
                            'elementHandlers': specialElementHandlers
                        },
                function (dispose) {
                    // dispose: object with X, Y of the last line add to the PDF 
                    //          this allow the insertion of new lines after html
                    pdf.save('Test.pdf');
                }, margins);
          
//             var columns = [
//            {title: "ID", dataKey: "id"},
//            {title: "Name", dataKey: "name"},
//            {title: "Country", dataKey: "country"},
//                    ...
//                    ];
//                    var rows = [
//                    {"id": 1, "name": "Shaw", "country": "Tanzania", ...},
//                    {"id": 2, "name": "Nelson", "country": "Kazakhstan", ...},
//                    {"id": 3, "name": "Garcia", "country": "Madagascar", ...},
//                            ...
//                            ];
//// Only pt supported (not mm or in)
//                    var doc = new jsPDF('p', 'pt');
//            doc.autoTable(columns, rows, {
//                styles: {fillColor: [100, 255, 255]},
//                columnStyles: {
//                    id: {fillColor: 255}
//                },
//                margin: {top: 60},
//                beforePageContent: function (data) {
//                    doc.text("Header", 40, 30);
//                }
//            });
//            doc.save('table.pdf');
    }

   
        </script>
    </head>
    <body >
        <a href="javascript:demoFromHTML()" class="button">Run Code</a>
        <div id="content">
            <h1>  
                We support special element handlers. Register them with jQuery-style.
            </h1>
        </div>
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
        <!-- DataTables JavaScript -->
        
        <script src="<c:url value='/resources/bower_components/jspdf/jspdf.min.js' />"></script>
        <script src="<c:url value='/resources/bower_components/jspdf/jspdf.plugin.autotable.js' />"></script>
        
        <script src="<c:url value='/resources/bower_components/datatables/media/js/jquery.dataTables.min.js' />"></script>
        <script src="<c:url value='/resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js' />"></script>
        <script src="<c:url value='http://mrrio.github.io/jsPDF/dist/jspdf.debug.js' />"></script>
        <script src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.0.16/jspdf.plugin.autotable.js' />"></script>
        <!-- Custom Theme JavaScript -->
        <script src="<c:url value='/resources/dist/js/sb-admin-2.js' />"></script>
        <!-- Custom Theme JavaScript -->

    </body>
</html>