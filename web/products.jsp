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
    <body >
        <div data-role="page" id="registerProduct" data-theme="a" >


            <div data-role="header">
                <h3>Cadastro de produtos.</h3>
            </div>             
            <div data-role="main" class="ui-content" >
                <div style="width: 50%;float:left">
                    <h1>Cadastro</h1>
                    <form method="GET" id="registerForm" action="/BuscaMack/FrontController" name="registro" data-ajax="false" autocomplete="off" >
                        <div data-role="fieldcontain" >
                            <label>Nome:</label>
                            <input type="text" name="nameRegister" value="" placeholder="Nome" required="">
                        </div>                
                        <div data-role="fieldcontain" >
                            <label>Descrição:</label>
                            <input type="text"  class="input-cpf" name="descriptionRegister" value="" maxlength="100" placeholder="Descrição" required >                    
                        </div>
                        <div data-role="fieldcontain" >                        
                            <label >Preço:</label>
                            <input type="number" name="priceRegister" step="0.01" min="0" value="" placeholder="Preço" required>  </div>                    

                        <div data-role="fieldcontain" >
                            <label>Imagem:</label>
                            <input type="text" name="imageRegister"  placeholder="Url da imagem - Exemplo: http://imagens.com/imagem.jpg" required >
                        </div>
                        <div data-role="fieldcontain" >
                            <label>Categoria:</label>
                            <input type="text" name="categoryRegister"  placeholder="Categoria - Exemplo: Celular, Notebook, Roupa, Calçado" required onblur="return validarSenha()">
                        </div>
                        <input type="hidden" name="action" value="saveUser" >
                        <button class="ui-btn ui-shadow ui-corner-all" type="submit" name="submit" >Registrar produto</button>
                    </form>
                </div>
                <div style="width:50%;float:left">
                    <h1>Cadastrados</h1>      
                    <table data-role="table" id="table-custom-2" data-mode="columntoggle" class="ui-body-d ui-shadow table-stripe ui-responsive" data-column-btn-theme="b" data-column-btn-text="Colunas..." data-column-popup-theme="a">
                        <thead>
                            <tr class="ui-bar-d">
                                <th>Nome</th>
                                <th>Descrição</th>
                                <th>Preço</th>             
                                <th>Categoria</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%if (((List<Product>) request.getSession().getAttribute("products")) != null) {
                                    for (Product product : (List<Product>) request.getSession().getAttribute("products")) {%>
                            <tr>
                                <td><%=product.getName()%></td>
                                <td><%=product.getDescription()%></td>
                                <td><%=product.getPrice()%></td>
                                <td><%=product.getCategory()%></td>                        
                            </tr>
                            <%}
                            }%>

                        </tbody>
                    </table>
                </div>            
            </div>
            <div data-role="footer" data-position="fixed" data-fullscreen="true">
                <h1>BuscaMack</h1>
            </div>  
        </div>
    </body>    
</html>
