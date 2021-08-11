<%@page import="java.util.List"%>
<%@page import="project.model.Usuario"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.controller.FormOperation"%>

<%
    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
    String urlAction = null;
%>    

<!DOCTYPE html "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/bootstrap.js" ></script>
        <script src="js/main.js"></script>
        <title>Iniciar sesión</title>
    </head>
    <body style="background:#d50000">
        <div class="container">
            <div class="row">
                <div class="col-sm">&nbsp;</div>
            </div>
            <div class="col-sm">
                <h1>Iniciar sesión</h1>
                <form action="<%=urlAction%>" method="post" id="formInicio">
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label" for="nombre">Usuario:</label>
                            <input class="form-control" id="txtUsuario" type="text" name="usuario" "/><br>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="password">Contraseña:</label>
                            <input class="form-control" id="txtPassword" type="password" name="password" "/><br>
                        </div>
                    </fieldset>
                    <div class="form-actions">
                        <input type="button" value="Iniciar Sesión" id="btnIniciarSesion"/>
                    </div>
                        No tienes una cuenta... <a href="registro.jsp">Registrarme</a>
                </form>
            </div>
        </div>
    </body>
    <footer class="bg-dark text-center text-lg-start fixed-bottom">
        <div class="text-center p-3 text-light" style="background-color: rgba(0, 0, 0, 0.2)" >
            <p>Edgar Benito Carbó</p>
        </div>
    </footer>
</html>
