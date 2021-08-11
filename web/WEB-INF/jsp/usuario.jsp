<%@page import="project.model.Usuario"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.controller.FormOperation"%>

<%
    FormOperation formOperation = (FormOperation) request.getAttribute("formOperation");
    String labelButton = "";
    String urlAction = "";
    switch (formOperation) {
        case INSERT:
            labelButton = "Insertar";
            urlAction = request.getContextPath() + "/usuario/insert.html";
            break;
        case LOGIN:
            labelButton = "Login";
            urlAction = request.getContextPath() + "/usuario/login.html";
            break;

    }


%>    

<!DOCTYPE html "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesión</title>
    </head>

    <style>

        .fUser{
            text-align: center;
        }

        input{
            align-content: center;
            border-top: 1px;
            border-right: 1px;
            border-left: 1px;
        }

        body{

            
            text-align: center;

        }

        #carouselExampleIndicators{
            width: 800px;
            margin: 0 auto;
            
        }

    </style>

    <body style="background:#000a12">
        <div class="container">
            <div class="row">
                <div class="col-sm">&nbsp;</div>
            </div>
            <div class="col-sm">
                <h1 style='color: #ffffff'>Iniciar sesión</h1>
                <form id="formulario" action="<%=urlAction%>" method="post" id="formInicio">

                    <fieldset>

                        <div class="form-group">
                            <label class="control-label" for="usuario" style='color: #ffffff'>Usuario:</label><br>
                            <input class="form-control" id="txtUsuario" type="text" name="usuario" "/><br>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="password" style='color: #ffffff'>Contraseña:</label>
                            <input class="form-control" id="txtPassword" type="password" name="password" "/><br>
                        </div>
                    </fieldset>
                    <div class="form-actions">
                        <input type="submit" value="<%=labelButton%>" id="btnIniciarSesion" />
                    </div>
                        <h5 style='color: #ffffff'>No tienes una cuenta... <a href="<%=request.getContextPath()%>/usuario/newForInsert.html">Registrarse</a><br><br><br>
                </form><br>
                
            </div>
        </div>
    </body>
    <footer>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner justify-content-center">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="https://images2.alphacoders.com/552/552971.jpg" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="https://images8.alphacoders.com/468/468739.jpg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="https://images4.alphacoders.com/246/246.jpg" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
    </footer>
</html>
