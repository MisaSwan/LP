<%-- 
    Document   : index
    Created on : 08/10/2014, 19:57:28
    Author     : 31381405
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <script>
            $(document).on("pageshow", "#Register", function () {
            <%
                if (request.getSession().getAttribute("usuarioLogado") != null) {
                    response.sendRedirect("products.jsp");
                }
            %>

            });
            function validarSenha() {

                if (document.registro.passRegister.value != document.registro.passRegisterOK.value) {
                    $('#popupWrongPassword').popup();
                    $('#popupWrongPassword').popup('open');
                    return false;
                } else
                {
                    return true;
                }
            }
        </script>
    </head>
    <body >
        <div data-role="page" id="register" data-theme="b">
            <div data-role="header">
                <div data-role="navbar" class="nav-glyphish-example" data-grid="c">
                    <ul>
                        <li><a href="index.jsp" data-transition="flip" id="house" data-icon="custom">Home</a></li>
                        <li><a href="products.jsp" id="outlet" data-transition="flip" data-icon="custom">Produtos</a></li>
                        <li><a href="partners.jsp" data-transition="flip" id="beer" data-icon="custom">Parceiros</a></li>        
                        <li><a href="#login" data-rel="popup" data-transition="flip" data-position-to="window" data-transition="pop" id="person" data-icon="custom">Login</a></li>        
                    </ul>
                </div>            
            </div>             
            <div data-role="main" class="ui-content">
                <form method="GET" id="registerForm" action="/ECommerce/FrontController" name="registro" data-ajax="false" autocomplete="off" >
                    <div data-role="fieldcontain" >
                        <label>Nome:</label>
                        <input type="text" name="nameRegister" value="" placeholder="Nome" required="">
                    </div>                
                    <div data-role="fieldcontain" >
                        <label>CPF:</label>
                        <input type="number"  class="input-cpf" name="cpfRegister" value="" maxlength="11" placeholder="CPF" required >                    

                    </div>
                    <div data-role="fieldcontain" >
                        <label>Usuário:</label>
                        <input type="text" name="userRegister" value="" placeholder="Usuário" required>
                    </div>
                    <div data-role="fieldcontain" >
                        <label>Senha:</label>
                        <input type="password" name="passRegister"  placeholder="Senha" required >
                    </div>
                    <div data-role="fieldcontain" >
                        <label>Confirmar senha:</label>
                        <input type="password" name="passRegisterOK"  placeholder="Confirmar senha" required onblur="return validarSenha()">
                    </div>
                    <div data-role="fieldcontain" >
                        <label>Email:</label>
                        <input type="email" name="emailRegister" value="" placeholder="Email"   required>
                    </div>
                    <div data-role="fieldcontain" >                    
                        <fieldset data-role="controlgroup" data-type="horizontal" required > 
                            <legend>Sexo:</legend>
                            <input type="radio" name="sexRegister" id="FRadio" value="F" checked>
                            <label for="FRadio">F</label>
                            <input type="radio" name="sexRegister" id="MRadio" value="M">
                            <label for="MRadio">M</label>
                        </fieldset>                    
                    </div>
                    <div data-role="fieldcontain" >
                        <div data-role="fieldcontain" >
                            <label >Idade:</label>
                            <input type="range" name="ageRegister" min="0" max="100" value="18"  required>  </div>                    
                    </div>
                    <input type="hidden" name="action" value="saveUser" >
                    <button class="ui-btn ui-shadow ui-corner-all" type="submit" name="submit" onClick="return validarSenha();" >Registrar</button>
                </form>
            </div>
            <div data-role="footer" data-position="fixed" data-fullscreen="true">
                <h1>E-Mack</h1>
            </div>           
            <div data-role="popup" id="popupWrongPassword">
                <p>As senhas não conferem, digite novamente.</p>
            </div>

        </div>
    </body>    
</html>
