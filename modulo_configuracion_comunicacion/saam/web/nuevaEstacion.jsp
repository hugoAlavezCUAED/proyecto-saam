<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAAM -- Mis Estaciones</title>
        <link href="lib/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="stylesheet"/>        
        <link rel="stylesheet" type="text/css" href="recursos/header.css"/>  
        <script src="lib/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function(){
                $(".label").css("color", "black");
                $(".label").css("font-size","1em");
                $(".error").hide();
                
                $("#crearEstacion").on("click", function(){
                    $(".error").hide();
                    var validacion = true;
                    validacion = validar();
                    if(validacion)
                        $("#nuevaEstacion").submit();
                });
                
                function validar(){
                    var validacion = true;
                    if($("#nombre").val() == ""){
                        $("#nombreError").show("slow");
                        validacion = false;
                    }
                    if($("#ip").val() == ""){
                        $("#ipError").show("slow");
                        validacion = false;
                    }
                    if($("#longitud").val() == "" || isNaN($("#longitud").val())){
                        $("#longitudError").show("slow");
                        validacion = false;
                    }
                    if($("#latitud").val() == "" || isNaN($("#latitud").val())){
                        $("#latitudError").show("slow");
                        validacion = false;
                    }
                    return validacion;
                }
            });
        </script>
    </head>
    <body>
        <header>
            <div class="page-header">
                <h1>Sistema de Apoyo al Agricultor Moderno</h1>      
            </div>
        </header>
        <nav>
            <ul>                 
                <li style="float:right"><a class="active" href="#about">admin</a></li>
                <li style="float:right"><a href="#contact">Logout</a></li>
            </ul> 
        </nav>
        <article>
            <center><h3 id="titulo">Nueva Estación</h3></center>
            <s:form id="nuevaEstacion" action="nuevaEstacion"  method="POST" namespace="/">
                <table>
                    <tr>    
                        <td colspan="2" class="error" id="nombreError">
                            <p class="bg-warning">Por favor capture el nombre de la estación</p>
                        </td>
                        <td>                            
                            <s:textfield id="nombre" key="estacion.nombre" label="Nombre estación"/> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="error" id="ipError">
                            <p class="bg-warning">Por favor capture la ip de la estación</p>
                        </td>
                        <td>
                            <s:textfield id="ip" key="estacion.ip" label="Ip estación"/> 
                        </td>
                    </tr>     
                    <tr>
                        <td>
                            <br>
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" class="error" id="longitudError">
                            <p class="bg-warning">Por favor capture el nombre de la longitud en formato número</p>
                        </td>
                        <td>
                            <s:textfield id="longitud" key="estacion.longitud" label="Ubicación (Lóngitud)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="error" id="latitudError">
                            <p class="bg-warning">Por favor capture el nombre de la longitud en formato número</p>
                        </td>
                        <td>
                            <s:textfield id="latitud" key="estacion.latitud" label="Ubicación (Latitud)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" >
                            <center>
                                <button type="button" class="btn btn-success" id="crearEstacion">Crear Estación</button>
                                <button type="button" class="btn btn-danger" onclick="window.location.href='estaciones.action'">Regresar</button>
                            </center>
                        </td>
                    </tr>                    
                </table>
            </s:form>
        </article>
        <br>
        <footer><center>Copyright &copy; SAAM.com</center></footer>
    </body>
</html>