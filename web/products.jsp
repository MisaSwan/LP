<%-- 
    Document   : index
    Created on : 08/10/2014, 19:57:28
    Author     : 31381405
--%>

<%@page import="java.util.Random"%>
<%@page import="java.util.List"%>
<%@page import="entities.Product"%>
<%@page import="edu.mack.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Random ran = new Random();
%>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/jquery.mobile-1.4.4.min.css" />
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/js/jquery.mobile-1.4.4.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="assets/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="assets/css/style.css"/>        
        <script type="text/javascript">
            $(document).ready(function() {
                if (!window.location.hash) {
                    window.location = window.location + '#loaded';
                    window.location.reload();
                }
            });</script>
    </head>
    <body >
        <div data-role="page" id="products" data-theme="b">
            <div data-role="panel" id="mypanel" data-display="push">
                <ul data-role="listview">
                    <form  method="GET"  action="/ECommerce/FrontController" data-ajax="false">
                        <%if (((List<String>) request.getSession().getAttribute("categories")) != null) {%>                       
                        <%for (String product : (List<String>) request.getSession().getAttribute("categories")) {%>
                        <li><a href="#" onclick="$(this).append('<input type=\'hidden\' name=\'category\' value=\'<%=product%>\'/>');"><%=product%></a></li>  
                            <%}%>
                            <%}%>
                        <input type="hidden" name="action" value="searchProduct"> 
                    </form>
                </ul> 
            </div>
            <div data-role="header">
                <div data-role="navbar" class="nav-glyphish-example" data-grid="c">
                    <ul>
                        <li><a href="index.jsp" data-transition="flip" id="house" data-icon="custom">Home</a></li>
                        <li><a href="products.jsp" id="outlet" data-transition="flip" data-icon="custom">Produtos</a></li>
                        <li><a href="partners.jsp" data-transition="flip" id="beer" data-icon="custom">Parceiros</a></li>        
                            <%if (request.getSession().getAttribute("usuarioLogado") == null) {
                            %>           
                        <li><a href="#login" data-rel="popup" data-transition="flip" data-position-to="window" data-transition="pop" id="person" data-icon="custom">Login</a></li>        
                            <%} else {%>
                        <li><a href="#" id="person" data-icon="custom"> <%=((Usuario) request.getSession().getAttribute("usuarioLogado")).getLogin()%></a></li>        
                            <%}
                            %>
                    </ul>
                </div>    </div>    
            <br/>
            <div data-role="main" class="ui-content">
                <div class="ui-field-contain ui-filterable">                    
                    <input type="search" name="searchIndex" id="filterProducts" value="" data-type="search" placeholder="Buscar Produtos">
                </div>
                <a class="ui-btn ui-btn-icon-left ui-icon-arrow-u-l" href="#mypanel">Categorias</a>
                <ul data-role="listview" data-split-icon="custom" data-theme="a"  data-split-theme="b" data-inset="true" data-filter="true" data-input="#filterIndex">
                    <%if (((List<Product>) request.getSession().getAttribute("products")) != null) {%>                       
                    <%for (Product product : (List<Product>) request.getSession().getAttribute("products")) {%>
                    <li><a href="#">                  
                            <img src="<%=product.getImage()%>"class="img-thumbnail">  
                            <h2><%=product.getName()%></h2>
                            <p><%=product.getDescription()%></p>
                            <span class="ui-li-aside hidden-xs"><strong>R$ <%=product.getPrice()%>0</strong></span></a>                     
                        <a href="#purchase" id="pricetag" data-icon="custom" data-rel="popup" onclick="buyProduct(this);" data-position-to="window" data-transition="pop">Comprar</a>
                    </li>  
                    <%}%>
                    <%}%>
                </ul> 
            </div>
            <div data-role="footer" data-position="fixed" data-fullscreen="true">
                <h1>E-Mack</h1>
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
            <div data-role="popup" id="purchase" data-theme="b" data-overlay-theme="b" class="ui-content" style="max-width:700px; padding-bottom:2em;">
                <div class="ui-body ui-body-b ui-corner-all">
                    <h3>Realizar a compra do produto:</h3>                      
                    <form  method="GET"  action="/ECommerce/FrontController" data-ajax="false">
                        <img id="productImage" class="img-thumbnail img-responsive" width="160px" style="float: left;margin:0 20px 0px 10px;"/>
                        <h4><span id="productPrice"  class="hidden-xs" style="float:right;"></span></h4>
                        <input type="hidden" id="productPrice2" name="productPrice"/>
                        <h3 id="productName" ></h3>                       
                        <input type="hidden" id="productName2" name="productName"/>
                        <h5 id="productDescription" ></h5>

                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <input type="hidden" name="action" value="buyProduct"> 
                        <div class="col-md-7">
                            <input type="text" id="AddressStreet" name="addressStreet" value="" placeholder="Rua"></div>
                        <div class="col-md-2">
                            <input type="number" id="AddressNumber" name="addressNumber" value="" placeholder="Número">
                        </div>
                        <div class="col-md-3">
                            <input type="text" id="AddressComplement" name="addressCompl" value="" placeholder="Complemento">
                        </div>
                        <div class="col-md-7">
                            <input type="text" id="AddressNeighboorhood" name="addressNeighborhood" value="" placeholder="Bairro">
                        </div>
                        <div class="col-md-5">
                            <input type="text" name="addressCity" id="AddressCity" value="" placeholder="Cidade">
                        </div>           
                        <div class="col-md-12">
                            <input type="number" id="quantity" name="quantity" value="" placeholder="Quantidade"/></div>
                        <div class="col-md-6">
                            <button class="ui-shadow ui-btn ui-corner-all" type="submit" data-mini="true" id="submit" onclick="$(this).append('<input type=\'hidden\' name=\'paymentMethod\' value=\'boleto\'/>');">Pagar com boleto</button></div>
                        <div class="col-md-6">
                        <div data-role="fieldcontain">
                            <label for="select-choice-1" class="select">Choose shipping method:</label>
                            <select name="bank_option" onselect="$(this).append('<input type=\'hidden\' name=\'paymentMethod\' value=\'debito\'/>')"" id="select-choice-1">
                                <option value="1">Banco X</option>
                                <option value="2">Banco Y</option>
                                <option value="3">Banco Z</option>
                                <option value="4">Banco A</option>
                            </select>
                        </div>                            
                        </div>
                    </form>
                </div>
            </div>
            <form  method="GET" id="Logout"  action="/ECommerce/FrontController" data-ajax="false">
                <input type="hidden" name="action" value="logoutUser">                
            </form>  
            <form  method="GET" id="LoadProducts"  action="/ECommerce/FrontController" data-ajax="false">
                <input type="hidden" name="jspName" value="products">   
                <input type="hidden" name="action" value="loadProduct">                
            </form>                  
        </div>
    </div>
</body>
<script type="text/javascript">
        function buyProduct(buyer) {
            $("#productName").text($(buyer).parent().find("h2").text());
            $("#productName2").val($(buyer).parent().find("h2").text());
            $("#productDescription").text($(buyer).parent().find("p").text());
            $("#productPrice").text($(buyer).parent().find("span").text());
            $("#productPrice2").val($(buyer).parent().find("span").text());
            $("#productImage").attr("src", $(buyer).parent().find("img").attr("src"));
        }

        function categoryFilter() {

        }
</script>
<script type="text/javascript">
    if (location.hash.indexOf('&loaded') == -1) {
        $('form#LoadProducts').trigger('submit');
    }</script>
</html>
