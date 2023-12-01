package org.iesvdm.jsp_servlet_jdbc.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.iesvdm.jsp_servlet_jdbc.dao.ClienteDAO;
import org.iesvdm.jsp_servlet_jdbc.dao.ClienteDAOImpl;
import org.iesvdm.jsp_servlet_jdbc.model.Cliente;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "BorrarClienteServlet", value = "/BorrarClienteServlet")
public class BorrarClienteServlet extends HttpServlet {
    private ClienteDAO clienteDAO = new ClienteDAOImpl();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int clienteId = Integer.parseInt(request.getParameter("codigo"));
            //borrar segun la id
            this.clienteDAO.delete(clienteId);
        }catch (NumberFormatException e){
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("ListarClienteServlet");
        dispatcher.forward(request,response);
    }
}
