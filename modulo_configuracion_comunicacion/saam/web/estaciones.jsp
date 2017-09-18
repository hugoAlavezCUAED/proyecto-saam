<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAAM -- Mis Estaciones</title>
        <link href="lib/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="stylesheet"/>
        <script src="lib/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
        <link rel="stylesheet" type="text/css" href="recursos/header.css"/>  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <div class="page-header">
                <h1>Sistema de Apoyo al Agricultor Moderno</h1>      
            </div>
        </header>
        <nav>
            <ul>
                <li><s:a action="nuevaEstacion">Nueva Estación</s:a></li>                 
                <li><s:a action="tiposcultivo">Tipos de Cultivo</s:a></li>
                <li style="float:right"><a class="active" href="#about">admin</a></li>
                <li style="float:right"><a href="#contact">Logout</a></li>
            </ul> 
        </nav>
        <article>
            <center><h3 id="titulo">Mis estaciones</h3></center>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>N°</th>
                        <th>Nombre</th>
                        <th>Ip</th>
                        <th>Longitud</th>
                        <th>Latitud</th>
                        <th>Acciones</th>
                    </tr>
                </thead>                    
                <tbody> 
                    <s:iterator value="estaciones">
                        <tr>
                            <td><s:property value="id"/></td>
                            <td><s:property value="nombre"/></td>
                            <td><s:property value="ip"/></td>
                            <td><s:property value="longitud"/></td>
                            <td><s:property value="latitud"/></td>
                            <td>
                                <s:form action="cultivos" method="post" namespace="/">
                                    <input type="hidden" value="<s:property value="id"/>" name="estacionId"/>
                                    <button type="button" class="btn btn-default btn-sm" onclick="submit();" title="Mostrar Cultivos">
                                        <span class="glyphicon glyphicon-grain"></span> 
                                    </button>
                                </s:form>
                                <s:form action="editarEstacion" method="post" namespace="/">
                                    <input type="hidden" value="<s:property value="id"/>" name="estacion.id"/>
                                    <button type="button" class="btn btn-default btn-sm" onclick="submit();" title="Editar Estacion">
                                        <span class="glyphicon glyphicon-cog"></span> 
                                    </button>
                                </s:form>
                                <s:form action="eliminarEstacion" method="post" namespace="/">
                                    <input type="hidden" value="<s:property value="id"/>" name="estacion.id"/>
                                    <button type="button" class="btn btn-default btn-sm" onclick="if(confirm('¿Desea eliminar la estación?')){submit()};" title="Eliminar estación">
                                        <span class="glyphicon glyphicon-trash"></span> 
                                    </button>
                                </s:form>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </article>
        <footer>Copyright &copy; SAAM.com</footer>
    </body>
</html>