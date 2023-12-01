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
//clase para listar
@WebServlet(name = "ListarClienteServlet", value = "/ListarClienteServlet")
public class ListarClienteServlet extends HttpServlet {
    private ClienteDAO socioDAO = new ClienteDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //listar todos
        List<Cliente> listado = this.socioDAO.getAll();
        request.setAttribute("listado", listado);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/banco/listado.jsp");

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

}