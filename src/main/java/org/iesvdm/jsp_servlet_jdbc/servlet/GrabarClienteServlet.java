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
    private ClienteDAO socioDAO = new ClienteDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = null;
        Optional<Cliente> optionalSocio = UtilServlet.validaGrabar(request);
        if (optionalSocio.isPresent()) {

            Cliente cliente = optionalSocio.get();
            this.socioDAO.create(cliente);
            List<Cliente> listado = this.socioDAO.getAll();
            request.setAttribute("listado", listado);

            dispatcher = request.getRequestDispatcher("ListarClienteServlet");
        } else {
            dispatcher = request.getRequestDispatcher("ListarClienteServlet");
        }
        dispatcher.forward(request,response);

    }

}