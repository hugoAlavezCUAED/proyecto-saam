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
                <li><s:a action="estaciones">Mis Estaciones</s:a></li>
                <li><s:a action="nuevoTipoCultivo">Nuevo  tipo de cultivo</s:a></li>                
                    <li style="float:right"><a class="active" href="#about">admin</a></li>
                    <li style="float:right"><a href="#contact">Logout</a></li>
                </ul> 
            </nav>
        </body>
        <article>
            <center><h3 id="titulo">Catálogo de Tipos de Cultivo</h3></center>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>N°</th>
                        <th>Nombre</th>
                        <th>Humedad mínima (%)</th>
                        <th>Humedad máxima (%)</th>
                        <th>Temperatura mínima (°C)</th>
                        <th>Temperatura máxima (°C)</th>
                        <th>Periódo de riego (hrs)</th>
                        <th>Acciones</th>
                    </tr>
                </thead>                    
                <tbody> 
                    <s:iterator value="tiposCultivo">
                        <tr>
                            <td><s:property value="id"/></td>
                            <td><s:property value="nombre"/></td>
                            <td><s:property value="humedadMin"/></td>
                            <td><s:property value="humedadMax"/></td>
                            <td><s:property value="temperaturaMin"/></td>
                            <td><s:property value="temperaturaMax"/></td>
                            <td><s:property value="periodoRiego"/></td>
                            <td>                                
                                <s:form action="actualizarTipoCultivo" method="post" namespace="/">
                                    <input type="hidden" value="<s:property value="id"/>" name="tipoCultivo.id"/>
                                    <button type="button" class="btn btn-default btn-sm" onclick="submit();" title="Editar Tipo Cultivo">
                                        <span class="glyphicon glyphicon-cog"></span> 
                                    </button>
                                </s:form>
                                <s:form action="eliminarTipoCultivo" method="post" namespace="/">
                                    <input type="hidden" value="<s:property value="id"/>" name="tipoCultivo.id"/>
                                    <button type="button" class="btn btn-default btn-sm" onclick="if(confirm('¿Desea eliminar el tipo de cultivo?')){submit()};" title="Eliminar TipoCultivo">
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
