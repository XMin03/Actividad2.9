<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: mattialu
  Date: 27/11/23
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //CÓDIGO DE VALIDACIÓN
    boolean valida = true;
    String codigo = null;
    try {
        codigo = request.getParameter("codigo");
    } catch (NumberFormatException nfe) {
        nfe.printStackTrace();
        valida = false;
    }
    if (valida) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            //Conexion
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_jsp_jdbc","mattialu", "");
            //Delete
            String sql = "DELETE FROM usuario WHERE usuario = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, codigo);
            int filasAfectadas = ps.executeUpdate();

            System.out.println("SOCIOS BORRADOS:  " + filasAfectadas);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try { ps.close(); } catch (Exception e) { /* Ignored */ }
            try { conn.close(); } catch (Exception e) { /* Ignored */ }
        }

    }
%>

<!-- REDIRECCIÓN POR JavaScript EN EL CLIENTE  -->
<script>document.location = "admin.jsp"</script>
</body>
</html>
