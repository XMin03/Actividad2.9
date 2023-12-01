<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>JSP - Hello World</title>
</head>
<body class="text-center">
<h1>Control de acceso</h1>
<form action="validation.jsp">
    <input type="text" placeholder="usuario" name="usuario"><br>
    <input type="password" placeholder="contraseña" name="password"><br>
    <input type="submit" value="Aceptar" class="bg-primary">
</form>
<%=
/*Errores*/
session.getAttribute("error") == null ?
        "" : session.getAttribute("error")
%>
<% session.removeAttribute("error"); %>
</body>
</html>