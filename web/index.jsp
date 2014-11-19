<%-- 
    Document   : index
    Created on : 08/10/2014, 19:57:28
    Author     : 31381405
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/jquery.mobile-1.4.4.min.css" />
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/js/jquery.mobile-1.4.4.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="assets/js/bootstrap.min.js"></script>    
        <link rel="stylesheet" href="assets/css/style.css"/>        
    </head>
    <body>
        <form id="load" method="GET" action="/ECommerce/FrontController">
            <input type="hidden" name="action" value="loadProduct"/>
            <input type="submit" id="submit" value="">
        </form>
        <script>
            $("#submit").click();
        </script>
    </body>    
</html>
