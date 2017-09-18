<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAAM -- Mis Cultivos</title>
        <link href="lib/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="stylesheet"/>
        <script src="lib/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
        <link rel="stylesheet" type="text/css" href="recursos/header.css"/>  
        <link rel="stylesheet" type="text/css" href="recursos/cultivos.css"/>
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
                <li><s:a action="estaciones">Mis estaciones</s:a></li>                 
                <li style="float:right"><a class="active" href="#about">admin</a></li>
                <li style="float:right"><a href="#contact">Logout</a></li>
            </ul> 
        </nav>
        <article>
            <center><h3 id="titulo">Mis Cultivos</h3></center> 
            <form action="cultivos.action" method="POST">
                <table id="contenedor">
                    <tr>
                        
                        <!--########ACTUADORES#########-->
                        <td>
                            <table id="actuadores">
                                <tr>
                                    <td colspan="2">
                                        <h3 class="rotulos">Actuadores</h3>
                                    </td>
                                    <td>
                                        <br>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="actuador">                                        
                                    <s:select key="actuador1.id" list="catalogoActuador" label="Actuador 1" headerKey="-1" headerValue="No definido" listValue="nombre" listKey="id"/>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td><br><br></td>
                                    <td><br><br></td>
                                </tr>
                                <tr>
                                    <td class="actuador">    
                                        <s:select key="actuador2.id" list="catalogoActuador" label="Actuador 2" headerKey="-1" headerValue="No definido" listValue="nombre" listKey="id"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><hr><br></td>
                                    <td><br><hr><br></td>
                                </tr>
                                <tr>
                                    <td class="actuador">    
                                        <s:select key="actuador3.id" list="catalogoActuador" label="Actuador 3" headerKey="-1" headerValue="No definido" listValue="nombre" listKey="id"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><br></td>
                                    <td><br><br></td>
                                </tr>
                                <tr>
                                    <td class="actuador">    
                                        <s:select key="actuador4.id" list="catalogoActuador" label="Actuador 4" headerKey="-1" headerValue="No definido" listValue="nombre" listKey="id"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br>
                                    </td>
                                    <td>
                                        <br>
                                    </td>
                                </tr>
                            </table>
                        </td> 
                        
                        
                        
                        
                        <!--########CULTIVOS#########-->
                        <td>
                            <table id="cultivos">
                                <tr>
                                    <td colspan="2">                                   
                                        <h3 class="rotulos">Cultivos</h3>                                    
                                    </td>
                                    <td>                                   
                                        <br>                                   
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br>
                                    </td> 
                                    <td>                                   
                                        <br>                                   
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><br></td>
                                    <td><br><br></td>
                                </tr>
                                <tr>
                                    
                                    <td class="actuador">                                        
                                        <s:select key="cultivo1.tipoCultivo.id" label="Cultivo 1" list="catalogoTipoCultivo" headerKey="-1" headerValue="Tipo de cultivo" listValue="nombre" listKey="id"/>
                                    </td>                                
                                </tr>
                                <tr>
                                    <td><br><hr><br></td>
                                    <td><br><hr><br></td>
                                </tr>
                                <tr>
                                    <td class="actuador">
                                        <s:select key="cultivo2.tipoCultivo.id" label="Cultivo 2" list="catalogoTipoCultivo" headerKey="-1" headerValue="Tipo de cultivo" listValue="nombre" listKey="id"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><br></td>
                                    <td><br><br></td>
                                </tr>
                                <tr>
                                    <td class="actuador">    
                                        <br>
                                    </td>
                                    <td><br></td>
                                </tr>
                                <tr>
                                    <td>
                                        <br>
                                    </td>
                                    <td>
                                        <br>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        
                        
                        
                        <!--########SENSORES#########-->
                        <td>
                            <table id="sensores">
                                <tr>
                                    <td colspan="2">
                                        <h3 class="rotulos">Sensores</h3>
                                    </td>
                                    <td>
                                        <br>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sensor">                                     
                                        <s:select key="sensor1.id" list="catalogoSensor" label="Sensor 1" headerKey="-1" headerValue="No definido" listValue="nombre" listKey="id"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><br></td>
                                    <td><br><br></td>
                                </tr>
                                <tr>
                                    <td class="sensor">    
                                        <s:select key="sensor2.id" list="catalogoSensor" label="Sensor 2" headerKey="-1" headerValue="No definido" listValue="nombre" listKey="id"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><hr><br></td>
                                    <td><br><hr><br></td>
                                </tr>
                                <tr>
                                    <td class="sensor">    
                                        <s:select key="sensor3.id" list="catalogoSensor" label="Sensor 3" headerKey="-1" headerValue="No definido" listValue="nombre" listKey="id"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><br></td>
                                    <td><br><br></td>
                                </tr>
                                <tr>
                                    <td class="sensor">    
                                        <s:select key="sensor4.id" list="catalogoSensor" label="Sensor 4" headerKey="-1" headerValue="No definido" listValue="nombre" listKey="id"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br>
                                    </td>
                                    <td>
                                        <br>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>                    
                </table>
                <br>
                <br>
                <table id="botones">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <center>
                                <button type="button" class="btn btn-success" onclick="submit()">Crear Estación</button>
                                <button type="button" class="btn btn-danger" onclick="window.location.href='estaciones.action'">Regresar</button>
                            </center>
                            <s:hidden key="estacionId"/>
                        </td>                        
                    </tr>
                </table>
            </form>
        </article>
        <br>
        <br>
        <br>
        <footer>Copyright &copy; SAAM.com</footer>
    </body>
</html>