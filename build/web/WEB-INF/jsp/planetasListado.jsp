<%@page import="java.util.ArrayList"%>
<%@page import="project.model.Satelite"%>
<%@page import="project.model.Planeta"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Planeta> planetas = (List<Planeta>) request.getAttribute("planetas");
    List<Satelite> satelites = (List<Satelite>) request.getAttribute("satelites");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Satelite</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <style>
            
            #espace{
                background-size: cover; 
            }
            
        </style>
    </head>
    <body id="espace" style="background-image: url('https://www.solofondos.com/wp-content/uploads/2016/03/milky-way-2695569__340.jpg')">
        <nav class="navbar navbar-expand-lg" style="background:#000a12">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="navbar-brand" href="#">Home</a>
                </li>
            </ul>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="<%=request.getContextPath()%>/planeta.html" style='color: #ffffff'>Planeta <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/satelite.html" style='color: #ffffff'>Satelite <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/usuario.html" style='color: #ffffff'>Usuarios <span class="sr-only">(current)</span></a>
                    </li>

                </ul>
                <ul class="navbar-nav">
                    <li class="ml-auto">
                        <a class="nav-link" href="<%=request.getContextPath()%>/index.html">Cerrar sesión <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row-fluid">
                <div class="span12">&nbsp;</div>
            </div>
            <div class="row-fluid">
                <div class="offset1  span10">
                    <div class="row-fluid">
                        <div class="span12">
                            <a id="btnNuevo" class="btn btn-primary" 
                               href="<%=request.getContextPath()%>/planeta/newForInsert.html">Nuevo Planeta</a>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <table class="table table-striped" style="background:#f5f5f5">
                                <thead>
                                    <tr>
                                        <th>IdPlaneta</th>
                                        <th>nombre</th>
                                        
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody class="table table-striped" style="background:#f5f5f5">
                                    <%
                                        int i = 1;
                                        String id = "", href = "";
                                        for (Planeta planeta : planetas) {
                                            ArrayList<Satelite> sateliteLista = new ArrayList<>();
                                            for (Satelite s : satelites) {
                                                if (s.getPlaneta().getIdPlaneta() == planeta.getIdPlaneta()) {
                                                    sateliteLista.add(s);
                                                }
                                            }
                                            id = "accordion" + i;
                                            href = "collapse" + i;
                                            i++;
                                    %>

                                    <tr class="accordion-toggle collapsed" id="<%=id%>" data-toggle="collapse" data-parent="#<%=id%>" href="#<%=href%>">
                                        <td><%=planeta.getIdPlaneta()%></td>
                                        <td><%=HtmlUtils.htmlEscape(planeta.getNombre())%></td>
                                        <td><a href="<%=request.getContextPath()%>/planeta/readForUpdate.html?id=<%=planeta.getIdPlaneta()%>" title="Editar">Editar</a></td>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/planeta/readForDelete.html?id=<%=planeta.getIdPlaneta()%>" title="Borrar" >Borrar</a>
                                        </td>
                                    </tr>
                                    <!-- Es crea una tr per a posarli dins la tabla de films de cada director -->
                                    <tr style="padding:0px;">
                                        <td colspan="5" style="padding:0px;">
                                            <!-- Es crea la tabla oculta (important la clase collapse in p-3 i el id generat antes en el for)-->
                                            <table id="<%=href%>" class="collapse in p-3 table table-bordered table-hover table-condensed">
                                                <thead>
                                                    <tr>
                                                        <th>IdSatelite</th>
                                                        <th>medida</th>
                                                        <th>periodo</th>
                                                        <th>peso</th>
                                                        <th>Borrar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- Per cada film es crea una row en la tabla -->
                                                    <%
                                                        for (Satelite s : sateliteLista) {
                                                    %>
                                                    <tr>

                                                        <td><a href="<%=request.getContextPath()%>/satelite/readForUpdate.html?id=<%=s.getIdSatelite()%>" title="Editar" ><%=s.getIdSatelite()%></a></td>
                                                        <td><%=s.getMedida()%></td>
                                                        <td><%=s.getPeriodo()%></td>
                                                        <td><%=s.getPeso()%></td>
                                                        <td>
                                                            <a href="<%=request.getContextPath()%>/satelite/readForDelete.html?id=<%=s.getIdSatelite()%>" title="Borrar" ><i class="bi bi-trash"></i></a>
                                                        </td>
                                                    </tr>
                                                    <%}%>
                                            </table>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="span1"></div>
            </div>
        </div>
        
    </body>
    <footer class="bg-dark text-center text-lg-start fixed-bottom">
        <div class="text-center p-3 text-light" style="background:#000a12" >
            <h5>Edgar Benito Carbó - 12/02/2021</h5>
        </div>
    </footer>
</html>