<%-- 
    Document   : index
    Created on : 08/10/2014, 19:57:28
    Author     : 31381405
--%>

<%@page import="edu.mack.entity.Produto"%>
<%@page import="java.util.List"%>
<%@page import="edu.mack.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/jquery.mobile-1.4.4.min.css" />
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/js/jquery.mobile-1.4.4.min.js"></script>
        <link rel="stylesheet" href="assets/css/style.css"/>      
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Rancho&effect=emboss">
 
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="assets/js/bootstrap.min.js"></script>



    </head>
    <body >
        <div data-role="page" id="index" data-theme="b" style="background-color: #000000">    
            <div data-role="header">
                <div data-role="navbar" class="nav-glyphish-example" data-grid="b">
                    <ul>
                        <li><a href="index.jsp" data-transition="flip" id="house" data-icon="custom">Home</a></li>
                        <li><a href="products.jsp" id="outlet" data-transition="flip" data-icon="custom">Produtos</a></li>                        
                            <%if (request.getSession().getAttribute("usuarioLogado") == null) {
                            %>           
                        <li><a href="#login" data-rel="popup" data-transition="flip" data-position-to="window" data-transition="pop" id="person" data-icon="custom">Login</a></li>        
                            <%} else {%>
                        <li><a href="#popupLogout" data-rel="popup" data-transition="slideup" id="person" data-icon="custom"> <%=((Usuario) request.getSession().getAttribute("usuarioLogado")).getLogin()%></a></li>        
                            <%}
                            %>
                    </ul>
                </div>                 
            </div>  


            <div data-role="main" class="ui-content" style='background-color: #000000'>       
                <br/>
                <%if (request.getSession().getAttribute("usuarioLogado") == null) {
                %> 
                <div id='welcome' class="font-effect-emboss">
                    <img src='assets/img/searcher.jpg' style="float:left;"/>
                    <h1>Bem vindo!</h1>
                    <h2>Nós encontraremos tudo que você precisa!</h2>
                    <h3>Para utilizar os serviços do BuscaMack, por favor faça <a href="#login" data-rel="popup" data-transition="flip" data-position-to="window" data-transition="pop" id="person" data-icon="custom">Login</a> ou <a href="register.jsp">Registre-se</a>.</h3>
                </div>
                <!--<div class="alert alert-info" role="alert" style='width:50%;margin: 0px auto;'>Você ainda não está logado! Por favor você precisa estar logado para utilizar o BuscaMack, faça <a href=''>Login</a>  ou <a href=''>Registre-se</a>.  </div>-->
                <%} else {%>
                <div class="ui-field-contain ui-filterable">                    
                    <input type="search" name="searchProduct" id="filterIndex" value="" data-type="search" placeholder="Buscar Produtos" >
                </div>
                <%}
                %>

            </div>
            <div data-role="footer" data-position="fixed" data-fullscreen="true">
                <h1>BuscaMack</h1>
            </div>
            <div data-role="popup" id="login" data-theme="b" data-overlay-theme="b" class="ui-content" style="max-width:700px; padding-bottom:2em;">
                <div class="ui-body ui-body-b ui-corner-all">

                    <form method="GET" action="/ECommerce/FrontController" data-ajax="false">
                        <h3>Login</h3>                      
                        <input type="text" name="usernameLogin" value="" placeholder="Usuário" required>
                        <input type="password" name="passLogin" value="" placeholder="Senha" required>
                        <input type="hidden" name="action" value="loginUser">
                        <button class="ui-shadow ui-btn ui-corner-all" type="submit" data-theme="b">Entrar</button>                                        
                        Não é cadastrado? <a href="register.jsp">Registre-se aqui.</a>
                    </form>
                </div>
            </div>            
            <div data-role="popup" id="popupLogout" data-theme="b">
                <ul data-role="listview" data-inset="true" style="min-width:210px;">
                    <li data-role="list-divider">Ação..</li>
                    <li><a onclick="$('form#Logout').trigger('submit')" >Logout</a></li>
                </ul>
            </div>
            <form  method="GET" id="Logout"  action="/ECommerce/FrontController" data-ajax="false">
                <input type="hidden" name="action" value="logoutUser">                
            </form>  
            <form  method="GET" id="LoadProducts"  action="/ECommerce/FrontController" data-ajax="false">
                <input type="hidden" name="jspName" value="index">   
                <input type="hidden" name="action" value="loadProduct">                
            </form>  
        </div>
    </body>
</html>
