<%-- 
    Document   : index
    Created on : 08/10/2014, 19:57:28
    Author     : 31381405
--%>

<%@page import="java.util.List"%>
<%@page import="edu.mack.entity.Product"%>
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
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="assets/js/bootstrap.min.js"></script>

    </head>
    <body >
        <div data-role="page" id="products" data-theme="b" style="background-color: #000000">            
            <div data-role="header">
                <div data-role="navbar" class="nav-glyphish-example" data-grid="b">
                    <ul>
                        <li><a href="index.jsp" data-transition="flip" id="house" data-icon="custom">Home</a></li>
                        <li><a href="products.jsp" id="radar" data-transition="flip" data-icon="custom">Buscador</a></li>                        
                            <%if (request.getSession().getAttribute("usuarioLogado") == null) {
                            %>           
                        <li><a href="#login2" data-rel="popup" data-transition="flip" data-position-to="window"id="person" data-icon="custom">Login</a></li>        
                            <%} else {%>
                        <li><a href="#popupLogout2" data-rel="popup" data-transition="flip"  id="person" data-icon="custom"> <%=((Usuario) request.getSession().getAttribute("usuarioLogado")).getLogin()%></a></li>        
                            <%}
                            %>
                    </ul>
                </div>    
            </div>                
            <div data-role="main" class="ui-content" style="background-color: #000000">
                <div id='welcome2' >
                    <%if (request.getSession().getAttribute("usuarioLogado") == null) {
                    %>       
<br/>
<br/>
                    <div class="alert alert-info" role="alert" style='width:50%;margin: 0px auto;'>Você ainda não está logado! Por favor você precisa estar logado para utilizar o BuscaMack, por favor faça <a href="#login" data-rel="popup" data-transition="flip" data-position-to="window" data-transition="pop" >Login</a> ou <a href="register.jsp">Registre-se</a>.</h3> </div>
                    <%} else {%>                                
                    <form  method="GET" id="searcProduct"  action="/BuscaMack/FrontController" data-ajax="false">
                        <input type="search" name="textLike" value="" data-theme="a" placeholder="Buscar Produtos" required>
                        <input type="hidden" name="action" value="searchProduct">                
                        <input type="submit" class="ui-btn " data-theme="a" value="Buscar"/>

                    </form>  

                    <ul data-role="listview" data-split-icon="custom" data-theme="a"  data-split-theme="b" data-inset="true" data-filter="true" data-input="#filterIndex">
                        <%if (((List<Product>) request.getSession().getAttribute("products")) != null) {                         
                          if (((List<Product>) request.getSession().getAttribute("products")).size() ==0) {%>                          
                        <div class="alert alert-warning" role="alert" style='width:50%;margin: 0px auto;'> Ops :( Sua pesquisa não encontrou nenhum produto correspondente, tente palavras-chave diferentes.</div>
                        <%}                     
                        for (Product product : (List<Product>) request.getSession().getAttribute("products")) {%>
                        <li><a href="#">                  
                                <img src="<%=product.getImage()%>"class="img-thumbnail">  
                                <h2><%=product.getName()%></h2>
                                <p><%=product.getDescription()%></p>
                                <span class="ui-li-aside hidden-xs"><strong>R$ <%=product.getPrice()%>0</strong></span></a>       
                            <a href="#purchase" id="pricetag" data-icon="custom" data-rel="popup" onclick="buyProduct(this);" data-position-to="window" data-transition="pop">Comprar</a>
                        </li>  
                        <%}
                        }%>
                    </ul> 
                    <%}
                    %>
                </div>
            </div>
            <div data-role="footer" data-position="fixed" data-fullscreen="true">
                <h1>BuscaMack</h1>
            </div>
            <div data-role="popup" id="login2" data-theme="b" data-overlay-theme="b" class="ui-content" style="max-width:700px; padding-bottom:2em;">
                <div class="ui-body ui-body-b ui-corner-all">

                    <form method="GET" action="/BuscaMack/FrontController" data-ajax="false">
                        <h3>Login</h3>                      
                        <input type="text" name="usernameLogin" value="" placeholder="Usuário" required>
                        <input type="password" name="passLogin" value="" placeholder="Senha" required>
                        <input type="hidden" name="action" value="loginUser">
                        <button class="ui-shadow ui-btn ui-corner-all" type="submit" data-theme="b">Entrar</button>                                        
                        Não é cadastrado? <a href="register.jsp">Registre-se aqui.</a>
                    </form>
                </div>
            </div>            
            <div data-role="popup" id="popupLogout2" data-theme="b">
                <ul data-role="listview" data-inset="true" style="min-width:210px;">
                    <li data-role="list-divider">Ação..</li>
                    <li><a onclick="$('form#Logout').trigger('submit')" >Logout</a></li>
                </ul>
            </div>            
            <form  method="GET" id="Logout"  action="/BuscaMack/FrontController" data-ajax="false">
                <input type="hidden" name="action" value="logoutUser">                
            </form>  
            <form  method="GET" id="LoadProducts"  action="/BuscaMack/FrontController" data-ajax="false">
                <input type="hidden" name="jspName" value="products">   
                <input type="hidden" name="action" value="loadProduct">                
            </form>                  
        </div>
    </div>
</body>
</html>
