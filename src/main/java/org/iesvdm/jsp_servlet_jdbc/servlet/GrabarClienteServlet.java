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
import java.util.Optional;

@WebServlet(name = "GrabarClienteServlet", value = "/GrabarClienteServlet")
public class GrabarClienteServlet extends HttpServlet {
    private ClienteDAO clienteDAO = new ClienteDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = null;
        //crear el cliente
        Optional<Cliente> optionalCliente = UtilServlet.validaGrabar(request);
        if (optionalCliente.isPresent()) {
            //crear
            Cliente cliente = optionalCliente.get();
            this.clienteDAO.create(cliente);

            dispatcher = request.getRequestDispatcher("ListarClienteServlet");
        } else {
            dispatcher = request.getRequestDispatcher("ListarClienteServlet");
        }
        dispatcher.forward(request,response);

    }

}