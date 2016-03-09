<%-- 
    Document   : home
    Created on : 08/03/2016, 09:30:30 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background:  dodgerblue; color:white; font-family: Centaur;font-size: 500%">
        <p style="text-align: center"><h1>${saludo}</h1></p>
    </body>
</html>-->
<!DOCTYPE html>
<html lang="en-US">
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <body>
        <p style="text-align: center"><h1>${saludo}</h1></p>
<!--    <div ng-app="">
        <p>Name : <input type="text" ng-model="name"></p>
        <h1>Hello {{name}}</h1>
    </div>-->
    <form action="/WebApplication/somepage" method="GET">
        <input type="text" name="nombre" value=""/>
        <!--<input type="text" name="cedula" value=""/>-->
        <input type="submit"/>
    </form>
  
</body>
</html>
