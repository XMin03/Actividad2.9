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
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_jsp_jdbc","mattialu", "");

            String sql = "DELETE FROM usuario WHERE usuario = ?";
            //CREO EL OBJETO PreparedStatement
            ps = conn.prepareStatement(sql);

            //A LA HORA DE ESTABLECER EL VALOR DEL PARÁMETRO PARA PODER EJECUTAR
            //LA QUERY DEBEMOS INDICAR LA POSICIÓN Y UTILIZAR EL SETTER DE TIPO ADECUADO
            ps.setString(1, codigo);

            //CUANDO EJECUTAS SENTENCIAS DML, INSERT, UPDATE, DELETE SE EMPLEA ps.executeUpdate()
            int filasAfectadas = ps.executeUpdate();

            System.out.println("SOCIOS BORRADOS:  " + filasAfectadas);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            //BLOQUE FINALLY PARA CERRAR LA CONEXIÓN CON PROTECCIÓN DE try-catch
            //SIEMPRE HAY QUE CERRAR LOS ELEMENTOS DE LA  CONEXIÓN DESPUÉS DE UTILIZARLOS
            //try { rs.close(); } catch (Exception e) { /* Ignored */ }
            try { ps.close(); } catch (Exception e) { /* Ignored */ }
            try { conn.close(); } catch (Exception e) { /* Ignored */ }
        }

    }
%>

<!-- REDIRECCIÓN POR JavaScript EN EL CLIENTE  -->
<script>document.location = "admin.jsp"</script>
</body>
</html>
