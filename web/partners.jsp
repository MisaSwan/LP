

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
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="assets/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="assets/css/style.css"/>        
    </head>
    <body >
        <div data-role="page" data-theme="b">
            <div data-role="header">
                <div data-role="navbar" class="nav-glyphish-example" data-grid="c">
                    <ul>
                        <li><a href="index.jsp" data-transition="flip" id="house" data-icon="custom">Home</a></li>
                        <li><a href="products.jsp" id="outlet" data-transition="flip" data-icon="custom">Produtos</a></li>
                        <li><a href="partners.jsp" data-transition="flip" id="beer" data-icon="custom">Parceiros</a></li>        
                                               <%if (request.getSession().getAttribute("usuarioLogado") == null) {
                         %>           
                        <li><a href="#login" data-rel="popup" data-transition="flip" data-position-to="window" data-transition="pop" id="person" data-icon="custom">Login</a></li>        
                        <%}else{%>
                        <li><a href="#" id="person" data-icon="custom"> <%=((Usuario)request.getSession().getAttribute("usuarioLogado")).getLogin()%></a></li>        
                        <%}
                        %>
                    </ul>
                </div>            
            </div>            
            <div data-role="main" class="ui-content">
                <br/>
                <div class="row">
                        <div class="col-md-3 col-sm-3"><img src="assets/img/mackenzie.png" style="display: block;margin: 0px auto;" width="60%" class="img-thumbnail" ><p align="center">A Universidade Presbiteriana Mackenzie, em parceria com a nossa empresa, elabora um diagnóstico a partir de uma análise das nossas capacidades, à luz das oportunidades e ameaças encontradas no mercado, tendo em vista identificar as melhores soluções para necessidades específicas.</p></div>
                        <div class="col-md-3 col-sm-3"><img src="assets/img/chuck.jpg" style="display: block;margin: 25px auto;" width="80%" class="img-thumbnail" ><p align="center">Carlos Ray Norris, mais conhecido como Chuck Norris, nos oferece parceria, conselho, e proteção. Temos o selo de aprovação dele!.</p></div>                
                        <div class="col-md-3 col-sm-3"><img src="assets/img/heineken2.png"  style="display: block;margin: 0px auto;" width="80%" class="img-thumbnail" ><p align="center">Graças a parceria da nossa empresa com as indústrias produtoras da Heineken, a cada compra de produtos da nossa loja, você concorre a prêmios, e milhares de heinekens para você e seus amigos.</p></div>
                        <div class="col-md-3 col-sm-3"><img src="assets/img/warner.png"  style="display: block;margin: 0px auto;" width="60%" class="img-thumbnail" ><p align="center">Temos uma nova parceria com a indústria de filmes Warner Bros, que nos garante sempre exclusividade na venda de produtos relacionados aos seus filmes, e prêmiações.</p></div>
                </div>
                <div data-role="footer" data-position="fixed" data-fullscreen="true">
                    <h1>E-Mack</h1>
                </div>
            </div>
    </body>
</html>
