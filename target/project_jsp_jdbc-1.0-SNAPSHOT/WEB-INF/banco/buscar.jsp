<%@ page import="java.util.ArrayList" %>
<%@ page import="org.iesvdm.jsp_servlet_jdbc.model.Cliente" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mattialu
  Date: 30/11/23
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>Buscar</title>
</head>
<body>
<h1>Gestibank</h1>
<table>
    <tr>
        <th>Nombre</th>
    </tr>
    <tr>
    <%
        List<Cliente> listado = (List<Cliente>) request.getAttribute("cliente");
        for (Cliente c:listado) {
            out.println("<td>" + c.getNombre_completo() + "</td>");
    %>
    <td>
        <form method="get" action="BuscarClienteServlet">
            <input type="hidden" name="codigo" value="<%=c.getCliente_id()%>"/>
            <input type="submit" value="Detalle">
        </form>
    </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
