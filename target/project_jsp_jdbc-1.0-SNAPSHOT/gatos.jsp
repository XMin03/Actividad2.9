<%--
  Created by IntelliJ IDEA.
  User: mattialu
  Date: 27/11/23
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gatos</title>
</head>
<body>
<style>
    td{
        width: 50px;
    }
    tr{
        height: 50px;
    }
    img{
        width: 50px;
        height: 50px;
    }
    table{
        display: flex;
        justify-content: center;
    }
</style>
<%
    try {
        //obtener la altura
        int number=Integer.parseInt(request.getParameter("numero"));
%>
<table>
        <%
        //alto
        for (int i = 0; i < number; i++) {
        %>
        <tr>
            <%
                //ancho
            for (int j = 1; j < number+i+1; j++) {
            %>
                <td>
                <%
                    //imagen (sacado al azar por sexto sentido)
                if (!(j+i-number<0)){
                %>
                  <img src="img/gato.jpg">
                <%
                }
                %>
                </td>
            <%
            }
            %>
        </tr>
        <%
        }
        %>
<table>
<%
    }catch (Exception e){
        e.printStackTrace();
    }

%>

</body>
</html>
