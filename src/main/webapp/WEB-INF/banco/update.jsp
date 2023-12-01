<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: mattialu
  Date: 29/11/23
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    //en desuso
    int id=-1;
    String nombre =null;
    String direccion = null;
    String telefono = null;
    String fecha = null;
    ArrayList<String> errores=new ArrayList<>();
    try{
        id = Integer.parseInt(request.getParameter("codigo"));
    }catch (NumberFormatException e){
        errores.add("Error");
    }
    try{
        Objects.requireNonNull(request.getParameter("nombre"));
        if (request.getParameter("nombre").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        nombre = request.getParameter("nombre");
    }catch (NullPointerException e){
        errores.add("nombre no puede ser nulo");
    }catch (RuntimeException e){
        errores.add("nombre no puede estar vacío");
    }
    try{
        Objects.requireNonNull(request.getParameter("direccion"));
        if (request.getParameter("direccion").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        direccion = request.getParameter("direccion");
    }catch (NullPointerException e){
        errores.add("direccion no puede ser nulo");
    }catch (RuntimeException e){
        errores.add("direccion no puede estar vacío");
    }
    try{
        Objects.requireNonNull(request.getParameter("telefono"));
        if (request.getParameter("telefono").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        telefono = request.getParameter("telefono");
        String copia=telefono.replace(" ","");
        copia=copia.replace("-","");
        int a=Integer.parseInt(copia);
    }catch (NumberFormatException e){
        errores.add("Caracteres inaceptadas entre los numero de telefono");
    }catch (NullPointerException e){
        errores.add("telefono no puede ser nulo");
    }catch (RuntimeException e){
        errores.add("telefono no puede estar vacío");
    }
    try{
        Objects.requireNonNull(request.getParameter("fecha"));
        if (request.getParameter("fecha").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        fecha = request.getParameter("fecha");
    }catch (NullPointerException e){
        errores.add("fecha no puede ser nulo");
    }catch (RuntimeException e){
        errores.add("fecha no puede estar vacío");
    }


    if (errores.isEmpty()) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_jsp_jdbc", "mattialu", "");
            String sql = "UPDATE cliente set nombre_completo=?, " +
                    "direccion=?, " +
                    "telefono=?, " +
                    "fecha_nacimiento=? " +
                    "where cliente_id=? ";
            ps = conn.prepareStatement(sql);
            int idx = 1;
            ps.setString(idx++, nombre);
            ps.setString(idx++, direccion);
            ps.setString(idx++, telefono);
            ps.setString(idx++, fecha);
            ps.setInt(idx, id);
            System.out.println(ps);
            int filasAfectadas = ps.executeUpdate();
            System.out.println("cliente actualizados:  " + filasAfectadas);
        } catch (Exception ex) {
            errores.add("Error UPDATE");
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
    if (errores.isEmpty()){
        response.sendRedirect("listado.jsp");
    }else{
        session.setAttribute("codigo",id);
        session.setAttribute("error", errores);
        response.sendRedirect("editar.jsp");
    }
%>
</body>
</body>
</html>
