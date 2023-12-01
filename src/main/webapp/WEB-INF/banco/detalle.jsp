<%@ page import="org.iesvdm.jsp_servlet_jdbc.model.Cliente" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mattialu
  Date: 30/11/23
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detalle</title>
    <link rel="stylesheet" type="text/css" href="estilos.css" />
</head>
<body>
<h1>Gestibank</h1>
<table>
    <tr><th>Codigo</th><th>Nombre</th><th>Direccion</th><th>Telefono</th><th>Fecha de Nacimiento</th></tr>
    <tr>
    <%
        Cliente c = (Cliente)request.getAttribute("cliente");
        out.println("<tr><td>"+ c.getCliente_id() + "</td>");
        out.println("<td>" + c.getNombre_completo() + "</td>");
        out.println("<td>" + c.getDireccion() + "</td>");
        out.println("<td>" + c.getTelefono() + "</td>");
        out.println("<td>" + c.getFecha_nacimiento() + "</td>");
    %>
   </tr>
</table>
<form method="post" action="ListarClienteServlet">
    <input type="submit" value="Acceptar">
</form>

</body>
</html>
