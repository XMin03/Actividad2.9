
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.Objects" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="org.iesvdm.PasswordUtils" %>
    <%--
  Created by IntelliJ IDEA.
  User: mattialu
  Date: 27/11/23
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
        <title>Grabar</title>
    </head>
    <body>
    <%

        String usuario =null;
        String p1 = null;
    String p2 = null;
    ArrayList<String> errores=new ArrayList<>();
    try{
        Objects.requireNonNull(request.getParameter("usuario"));
        if (request.getParameter("usuario").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        usuario = request.getParameter("usuario");
    }catch (NullPointerException e){
        errores.add("usuario no puede ser nulo");
    }catch (RuntimeException e){
        errores.add("usuario no puede estar vacío");
    }
    try{
        Objects.requireNonNull(request.getParameter("p1"));
        Objects.requireNonNull(request.getParameter("p2"));
        if (request.getParameter("p1").isBlank() || request.getParameter("p2").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        p1 = request.getParameter("p1");
        p2 = request.getParameter("p2");
    }catch (NullPointerException e){
        errores.add("Contraseña no puede ser nulo");
    }catch (RuntimeException e){
        errores.add("Contraseña no puede estar vacío");
    }


    if (errores.isEmpty()) {
        if (!p1.equals(p2)){
            errores.add("Contraseñas no iguales");
            session.setAttribute("error", errores);
            response.sendRedirect("formularioUsuario.jsp");
        }else{
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                p1= PasswordUtils.hashPassword(p1);
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_jsp_jdbc", "mattialu", "");
                String sql = "INSERT INTO usuario VALUES ( " +
                        "?, " + //usuario
                        "?)"; //contrasena
                ps = conn.prepareStatement(sql);
                int idx = 1;
                ps.setString(idx++, usuario);
                ps.setString(idx++, p1);

                int filasAfectadas = ps.executeUpdate();
                System.out.println("SOCIOS GRABADOS:  " + filasAfectadas);
                response.sendRedirect("admin.jsp");
            } catch (Exception ex) {
                errores.add("Error insertar");
                session.setAttribute("error", errores);
                response.sendRedirect("formularioUsuario.jsp");
            } finally {
                //BLOQUE FINALLY PARA CERRAR LA CONEXIÓN CON PROTECCIÓN DE try-catch
                //SIEMPRE HAY QUE CERRAR LOS ELEMENTOS DE LA  CONEXIÓN DESPUÉS DE UTILIZARLOS
                //try { rs.close(); } catch (Exception e) { /* Ignored */ }
                try {
                    ps.close();
                } catch (Exception e) { /* Ignored */ }
                try {
                    conn.close();
                } catch (Exception e) { /* Ignored */ }
            }
        }

    } else {
        session.setAttribute("error", errores);
        response.sendRedirect("formularioUsuario.jsp");
    }
%>

</body>
</html>
