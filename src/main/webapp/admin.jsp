<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: mattialu
  Date: 27/11/23
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>Gestión de Usuarios</title>
</head>
<body>
<h1>Gestión de Usuarios</h1>
<%
    /*CRUD DE USUARIO*/
    Connection conexion=null;
    Statement s=null;
    ResultSet listado=null;

    try{
        //conexion
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_jsp_jdbc","mattialu", "");
        s = conexion.createStatement();
        //listar
        listado = s.executeQuery ("SELECT * FROM usuario");
%>
<table>
    <tr><th>Usuario</th><th>Contraseña</th><th><a href="formularioUsuario.jsp">+</a></th></tr>
    <%
        //imprir
        while (listado.next()) {
            out.println("<tr><td>"+listado.getString("usuario") + "</td>");
            out.println("<td>" + listado.getString("contrasena") + "</td>");
            //si es admin no tendra la opcion de borrar
            if (!listado.getString("usuario").equals("admin")){
    %>
    <td>
        <form method="get" action="borrarUsuario.jsp">
            <input type="hidden" name="codigo" value="<%=listado.getString("usuario") %>"/>
            <input type="submit" value="borrar">
        </form>
    </td>
    <%}%>
    </tr>
    <%
        }
            conexion.close();
            s.close();
            listado.close();
        }catch (Exception e){
            out.println("Error");
        }  finally {
            try {
                conexion.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                s.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                listado.close();
            } catch (Exception e) { /* Ignored */ }
        }
    %>
</table>

</body>
</html>
