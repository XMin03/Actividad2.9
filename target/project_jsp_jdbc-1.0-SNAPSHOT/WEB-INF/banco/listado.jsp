<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.iesvdm.jsp_servlet_jdbc.model.Cliente" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mattialu
  Date: 29/11/23
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="estilos.css" />

    <title>Clientes</title>
</head>
<body>
<h1>Gestibank</h1>
<table>
    <tr><th>Codigo</th><th>Nombre</th><th>Direccion</th><th>Telefono</th><th>Fecha de Nacimiento</th></tr>
    <%//listar todos
        List<Cliente> listado = (List<Cliente>) request.getAttribute("listado");
        for (Cliente c:listado) {
            int id = c.getCliente_id();
            out.println("<tr><td>"+ id + "</td>");
            out.println("<td>" + c.getNombre_completo() + "</td>");
            out.println("<td>" + c.getDireccion() + "</td>");
            out.println("<td>" + c.getTelefono() + "</td>");
            out.println("<td>" + c.getFecha_nacimiento() + "</td>");
            //Editar y borrar
    %>
    <td>
    <form method="get" action="EditarClienteServlet">
        <input type="hidden" name="codigo" value="<%=id%>"/>
        <input type="submit" value="Editar">
    </form>
    </td>
    <td>
        <form method="post" action="BorrarClienteServlet">
            <input type="hidden" name="codigo" value="<%=id %>"/>
            <input type="submit" value="borrar">
        </form>
    </td></tr>
    <%
    }
        //añadir cliente
    %>
    <form method="post" action="GrabarClienteServlet">
    <tr>
        <td><input type="number" name="codigo" placeholder="codigo"></td>
        <td><input type="text" name="nombre_completo" placeholder="nombre"></td>
        <td><input type="text" name="direccion" placeholder="direccion"></td>
        <td><input type="text" name="telefono" placeholder="telefono"></td>
        <td><input type="date" name="fecha_nacimiento" placeholder="fecha de nacim."></td>
        <td><input type="submit" value="añadir"></td>
    </tr>
    </form>
    <tr>
        <%//errores de añadir
            ArrayList<String> errores = (ArrayList<String>) request.getAttribute("error");
            if(errores==null){
                out.println("");
            }else{
                for (String errore : errores) {
                    out.println("<td>" + errore + "</td>");
                }
            }
        %>
    </tr>
</table>
<form method="post" action="BuscarClienteServlet">
    <label>nombre</label>
    <input type="text" name="nombre">
    <input type="submit" value="buscar">
</form>
<%//errores de buscar
    String error = (String)request.getAttribute("errorBuscar");
    if(error==null){
        out.println("");
    }else{
        out.println(error);
    }
%>
</body>
</html>
