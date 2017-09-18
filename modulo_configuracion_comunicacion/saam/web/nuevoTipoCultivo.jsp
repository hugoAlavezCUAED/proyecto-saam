<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAAM -- Tipos de Cultivo</title>
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
                
                $("#crearTipoCultivo").on("click", function(){
                    $(".error").hide();
                    var validacion = true;
                    validacion = validar();
                    if(validacion)
                        $("#nuevoTipoCultivo").submit();
                });
                
                function validar(){
                    var validacion = true;
                    if($("#nombre").val() == "" ){
                        $("#nombreError").show("slow");
                        validacion = false;
                    }
                    if($("#hMin").val() == "" || isNaN($("#hMin").val())){
                        $("#hminError").show("slow");
                        validacion = false;
                    }
                    if($("#hMax").val() == "" || isNaN($("#hMax").val())){
                        $("#hmaxError").show("slow");
                        validacion = false;
                    }
                    if($("#tMin").val() == "" || isNaN($("#tMin").val())){
                        $("#tMinError").show("slow");
                        validacion = false;
                    }
                    if($("#tMax").val() == "" || isNaN($("#tMax").val())){
                        $("#tMaxError").show("slow");
                        validacion = false;
                    }
                    if($("#periodo").val() == "" || isNaN($("#periodo").val())){
                        $("#periodoError").show("slow");
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
            <center><h3 id="titulo">Nuevo Tipo de Cultivo</h3></center>
            <s:form id="nuevoTipoCultivo" action="nuevoTipoCultivo"  method="POST" namespace="/">
                <table>
                    <tr>    
                        <td colspan="2" class="error" id="nombreError">
                            <p class="bg-warning">Por favor capture el nombre del tipo de cultivo</p>
                        </td>
                        <td>                            
                            <s:textfield id="nombre" key="tipoCultivo.nombre" label="Nombre del tipo de cultivo"/> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="error" id="hminError">
                            <p class="bg-warning">Por favor capture la humedad mínima (sólo números)</p>
                        </td>
                        <td>
                            <s:textfield id="hMin" key="tipoCultivo.humedadMin" label="Humedad mínima (%)"/> 
                        </td>
                    </tr>     
                    <tr>
                        <td>
                            <br>
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" class="error" id="hmaxError">
                            <p class="bg-warning">Por favor capture la humedad máxima (sólo números)</p>
                        </td>
                        <td>
                            <s:textfield id="hMax" key="tipoCultivo.humedadMax" label="Humedad máxima (%)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="error" id="tMinError">
                            <p class="bg-warning">Por favor capture la temperatura mínima (sólo números)</p>
                        </td>
                        <td>
                            <s:textfield id="tMin" key="tipoCultivo.temperaturaMin" label="Temperatura mínima (°C)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="error" id="tMaxError">
                            <p class="bg-warning">Por favor capture la temperatura máxima (sólo números)</p>
                        </td>
                        <td>
                            <s:textfield id="tMax" key="tipoCultivo.temperaturaMax" label="Temperatura máxima (°C)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="error" id="periodoError">
                            <p class="bg-warning">Por favor capture el período de riego (sólo números)</p>
                        </td>
                        <td>
                            <s:textfield id="periodo" key="tipoCultivo.periodoRiego" label="Periodo de riego (Hrs.)"/>
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
                                <button type="button" class="btn btn-success" id="crearTipoCultivo">Crear Tipo Cultivo</button>
                                <button type="button" class="btn btn-danger" onclick="window.location.href='tiposcultivo.action'">Regresar</button>
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