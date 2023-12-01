package org.iesvdm.jsp_servlet_jdbc.model;

import java.sql.Date;
import java.util.Objects;

public class Cliente {

    private int cliente_id;
    private String nombre_completo;
    private String direccion;
    private String telefono;
    private String fecha_nacimiento;

    public Cliente() {
    }

    public Cliente(int cliente_id, String nombre_completo, String direccion, String telefono, String fecha_nacimiento) {
        this.cliente_id = cliente_id;
        this.nombre_completo = nombre_completo;
        this.direccion = direccion;
        this.telefono = telefono;
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public int getCliente_id() {
        return cliente_id;
    }

    public void setCliente_id(int cliente_id) {
        this.cliente_id = cliente_id;
    }

    public String getNombre_completo() {
        return nombre_completo;
    }

    public void setNombre_completo(String nombre_completo) {
        this.nombre_completo = nombre_completo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Cliente cliente = (Cliente) o;
        return cliente_id == cliente.cliente_id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(cliente_id);
    }

    @Override
    public String toString() {
        return "Cliente{" +
                "cliente_id=" + cliente_id +
                ", nombre_completo='" + nombre_completo + '\'' +
                ", direccion='" + direccion + '\'' +
                ", telefono='" + telefono + '\'' +
                ", fecha_nacimiento=" + fecha_nacimiento +
                '}';
    }
}
