package org.iesvdm.jsp_servlet_jdbc.servlet;

import jakarta.servlet.http.HttpServletRequest;
import org.iesvdm.jsp_servlet_jdbc.model.Cliente;

import java.util.ArrayList;
import java.util.Date;
import java.util.Objects;
import java.util.Optional;

public class UtilServlet {

    public static Optional<Cliente> validaGrabar(HttpServletRequest request) {

        //CÓDIGO DE VALIDACIÓN
        int cliente_id = -1;
        String nombre_completo = null;
        String direccion = null;
        String telefono = null;
        String fecha_nacimiento = null;
        ArrayList<String> errores=new ArrayList<>();
        try{
            cliente_id = Integer.parseInt(request.getParameter("codigo"));
        }catch (NumberFormatException e){
            errores.add("codigo no es un número");
        }
        try{
            Objects.requireNonNull(request.getParameter("nombre_completo"));
            if (request.getParameter("nombre_completo").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
            nombre_completo = request.getParameter("nombre_completo");
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
            Objects.requireNonNull(request.getParameter("fecha_nacimiento"));
            if (request.getParameter("fecha_nacimiento").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
            fecha_nacimiento = request.getParameter("fecha_nacimiento");
        }catch (NullPointerException e){
            errores.add("fecha_nacimiento no puede ser nulo");
        }catch (RuntimeException e){
            errores.add("fecha_nacimiento no puede estar vacío");
        }
        //FIN CÓDIGO DE VALIDACIÓN

        if (errores.isEmpty()){
            return Optional.of(new Cliente(cliente_id, nombre_completo, direccion, telefono, fecha_nacimiento));
        }else{
            request.setAttribute("error",errores);
            return Optional.empty();
        }
    }
}
