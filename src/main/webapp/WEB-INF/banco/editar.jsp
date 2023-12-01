<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: mattialu
  Date: 29/11/23
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>Title</title>
</head>
<body>
<form method="post" action="EditarClienteServlet">
    <%
        String codigo=request.getParameter("codigo");
        //codigo=codigo==null? session.getAttribute("codigo").toString() :codigo;
    %>
    <input type="hidden" name="codigo" value="<%=codigo%>">
    <label>Codigo: <%=codigo%></label>
        <input type="text" name="nombre_completo" placeholder="nombre">
        <input type="text" name="direccion" placeholder="direccion">
        <input type="text" name="telefono" placeholder="telefono">
        <input type="date" name="fecha_nacimiento" placeholder="fecha de nacim.">
        <input type="submit" value="cambiar">
</form>
<table>
<tr>
    <%
        ArrayList<String> errores = (ArrayList<String>) request.getAttribute("error");
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
