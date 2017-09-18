<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SAAM Login</title>
        <link href="lib/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="stylesheet"/>
        <script src="lib/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
        <link rel="stylesheet" type="text/css" href="recursos/styles.css"/>           
    </head>
    <body>
        <div class="encabezado-titulo">
            <h1>SAAM</h1>
            <h2>Sistema de Apoyo al Agricultor Moderno</h2>
        </div>
        
        <div class="container">
            <s:form action="/login" validate="true" method="post" namespace="action">                
                <image src="imagenes/icon1.png" class="img-bicarg"/>
                <div class="form-input">
                    <input type="text" name="user.username" placeholder="Ingrese usuario"/>
                </div>
                <div>
                    <input type="password" name="user.password" placeholder="Ingrese contraseña"/>
                </div>
                <s:submit cssClass="btn btn-primary" name="acceder" value="acceder" align="center" id="acceder"/>                    
                <s:actionerror/>
            </s:form>            
        </div>
    </body>
</html>