<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: mattialu
  Date: 27/11/23
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>Formulario Socio</title>
</head>
<body>
<h2>Introduzca los datos del nuevo cliente:</h2>
<form method="post" action="grabarUsuario.jsp">

    Usuario <input type="text" name="usuario"/></br>
    Contraseña <input type="password" name="p1"/></br>
    Repite Contraseña <input type="password" name="p2"/></br>
    <input type="submit" value="Aceptar" class="bg-primary">
</form>
<table>
    <tr>
        <%
            ArrayList<String> errores = (ArrayList<String>) session.getAttribute("error");
            if(errores==null){
                out.println("");
            }else{
                for (String errore : errores) {
                    out.println("<td>" + errore + "</td>");
                }
            }
        %>
        <% session.removeAttribute("error"); %>
    </tr>
</table>

</body>
</html>
