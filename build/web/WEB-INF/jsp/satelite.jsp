<%@page import="project.model.Satelite"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.controller.FormOperation"%>

<%
    FormOperation formOperation = (FormOperation) request.getAttribute("formOperation");
    String labelButton = null;
    String urlAction = null;
    switch (formOperation) {
        case INSERT:
            labelButton = "Insertar";
            urlAction = request.getContextPath() + "/satelite/insert.html";
            break;
        case UPDATE:
            labelButton = "Actualizar";
            urlAction = request.getContextPath() + "/satelite/update.html";
            break;
        case DELETE:
            labelButton = "Borrar";
            urlAction = request.getContextPath() + "/satelite/delete.html";
            break;
        default:
            throw new RuntimeException("El valor de 'formOperation' no es valido" + formOperation);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Satelite</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/bootstrap.js" ></script>
    </head>

    <style>
        body{


            text-align: center;

        }
    </style>

    <body style="background:#000a12">
        <div class="container">
            <div class="row">
                <div class="col-sm">&nbsp;</div>
            </div>
            <div class="row">
                <div class="col-sm">
                    <h3 style='color: #ffffff'>Satelite</h3>
                    <form action="<%=urlAction%>" method="post" >
                        <fieldset>
                            <div class="form-group">
                                <label class="control-label" for="idSatelite" style='color: #ffffff'>IdSatelite</label>
                                <input class="form-control disabled " id="idSatelite" name="idSatelite" type="text" value="${satelite.idSatelite}" readonly="readonly">
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="periodo" style='color: #ffffff'>Periodo</label>
                                <input class="form-control" id="periodo" type="text" name="periodo" value="${satelite.periodo}" >
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="medida" style='color: #ffffff'>Medida</label>
                                <input class="form-control" id="medida" type="text" name="medida" value="${satelite.medida}" >
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="peso" style='color: #ffffff'>Peso</label>
                                <input class="form-control" id="peso" type="text" name="peso" value="${satelite.peso}" >
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="idPlaneta">idPlaneta</label>
                                <input class="form-control disabled " id="idPlaneta" name="idPlaneta" type="text" value="${satelite.getPlaneta().idPlaneta}">
                            </div>


                        </fieldset>

                        <div class="form-actions">
                            <button id="aceptarBtn" class="btn btn-primary" type="submit"><%=labelButton%></button>
                            <a class="btn" href="<%=request.getContextPath()%>/satelite.html" style='color: #ffffff'>Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </body>

</html>