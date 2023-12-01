package org.iesvdm.jsp_servlet_jdbc.dao;

import org.iesvdm.jsp_servlet_jdbc.model.Cliente;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class ClienteDAOImpl extends AbstractDAOImpl implements ClienteDAO {
    //insert
    @Override
    public void create(Cliente cliente) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultSet rsGenKeys = null;
        try {
            conn = connectDB();
            ps = conn.prepareStatement("INSERT INTO cliente VALUES (?, ? , ?, ?,?)");

            int idx = 1;
            ps.setInt(idx++, cliente.getCliente_id());
            ps.setString(idx++, cliente.getNombre_completo());
            ps.setString(idx++, cliente.getDireccion());
            ps.setString(idx++, cliente.getTelefono());
            ps.setString(idx, cliente.getFecha_nacimiento());

            int rows = ps.executeUpdate();
            if (rows == 0)
                System.out.println("INSERT de cliente con 0 filas insertadas.");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }

    }
    //list
    @Override
    public List<Cliente> getAll() {

        Connection conn = null;
        Statement s = null;
        ResultSet rs = null;

        List<Cliente> listCliente = new ArrayList<>();

        try {
            conn = connectDB();

            // Se utiliza un objeto Statement dado que no hay parámetros en la consulta.
            s = conn.createStatement();

            rs = s.executeQuery("SELECT * FROM cliente");
            while (rs.next()) {
                Cliente cliente = new Cliente();

                cliente.setCliente_id(rs.getInt("cliente_id"));
                cliente.setNombre_completo(rs.getString("nombre_completo"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                listCliente.add(cliente);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, s, rs);
        }
        return listCliente;

    }
    //search by name
    @Override
    public List<Cliente> find(String nombre) {
        return this.getAll().stream().filter(c->c.getNombre_completo().contains(nombre)).collect(Collectors.toList());
    }
    //search by id
    @Override
    public Optional<Cliente> find(int id) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("SELECT * FROM cliente WHERE cliente_id = ?");

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {
                Cliente cliente = new Cliente();

                cliente.setCliente_id(rs.getInt("cliente_id"));
                cliente.setNombre_completo(rs.getString("nombre_completo"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setFecha_nacimiento(rs.getString("fecha_nacimiento"));

                return Optional.of(cliente);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }

        return Optional.empty();

    }
    //update
    @Override
    public void update(Cliente cliente) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("UPDATE cliente SET nombre_completo = ?, direccion = ?, telefono = ?, fecha_nacimiento = ?  WHERE cliente_id = ?");
            int idx = 1;
            ps.setString(idx++, cliente.getNombre_completo());
            ps.setString(idx++, cliente.getDireccion());
            ps.setString(idx++, cliente.getTelefono());
            ps.setString(idx++, cliente.getFecha_nacimiento());
            ps.setInt(idx, cliente.getCliente_id());

            int rows = ps.executeUpdate();

            if (rows == 0)
                System.out.println("Update de cliente con 0 registros actualizados.");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }

    }
    //delete
    @Override
    public void delete(int id) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("DELETE FROM cliente WHERE cliente_id = ?");
            int idx = 1;
            ps.setInt(idx, id);

            int rows = ps.executeUpdate();

            if (rows == 0)
                System.out.println("Delete de cliente con 0 registros eliminados.");


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }

    }
}
