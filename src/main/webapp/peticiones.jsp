<%-- 
    Document   : peticiones
    Created on : 6/10/2021, 06:31:29 PM
    Author     : rodriguezprr
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.Contacto"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>


<%    // Iniciando respuesta JSON.
    Contacto c1 = new Contacto();
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarContacto",
        "eliminarContacto",
        "listarContacto",
        "guardarContacto"
    });

    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardarContacto")) {

            //int numeroIdentificacion = Integer.parseInt(request.getParameter("numeroIdentificacion"));
            String numeroIdentificacion = request.getParameter("numeroIdentificacion");
            String nombre = request.getParameter("nombre");
            
            String apellido = request.getParameter("apellido");
            String genero = request.getParameter("genero");
            String tipoident = request.getParameter("tipoIdentificacion");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String email = request.getParameter("email");
            String ciudad = request.getParameter("ciudad");
            String tipoUsuario = request.getParameter("tipoUsuario");
            String contrasena = request.getParameter("contrasena");
            String estado = request.getParameter("estado");
            //boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));
//
            Contacto c = new Contacto();
            c.setIdentificacion(Integer.parseInt(numeroIdentificacion));
            c.setNombre(nombre);
            c.setApellido(apellido);
            c.setGenero(genero);
            c.setTipoIdentificacion(tipoident);
            c.setTelefono(telefono);
            c.setDireccion(direccion);
            c.setEmail(email);
            c.setCiudad(ciudad);
            c.setTipoUsuario(tipoUsuario);
            c.setContrasena(contrasena);
            c.setEstado(estado);
            if (c.guardarContacto()) {
//            if (true) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminarContacto")) {
            Contacto c = new Contacto();
            String numeroIdentificacion = request.getParameter("numeroIdentificacion");
            if (c.borrarContacto(Integer.parseInt(numeroIdentificacion))) {
//            if (true) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listarContacto")) {
            Contacto c = new Contacto();
            List<Contacto> lista = c.listarContactos();
            respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(lista);
            
            /*
            try{
                List<Contacto> lista = c.listarContactos();
                respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(lista);
            }catch(SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"Contactos\":[]";
                Logger.getLogger(Contacto.class.getName()).log(Level.SEVERE, null, ex);
            }
            */
        } else if (proceso.equals("actualizarContacto")) {
            String numeroIdentificacion = request.getParameter("numeroIdentificacion");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String genero = request.getParameter("genero");
            String tipoident = request.getParameter("tipoIdentificacion");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String email = request.getParameter("email");
            String ciudad = request.getParameter("ciudad");
            String tipoUsuario = request.getParameter("tipoUsuario");
            String contrasena = request.getParameter("contrasena");
            String estado = request.getParameter("estado");
            //boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));
//
            Contacto c = new Contacto();
            c.setIdentificacion(Integer.parseInt(numeroIdentificacion));
            c.setNombre(nombre);
            c.setApellido(apellido);
            c.setGenero(genero);
            c.setTipoIdentificacion(tipoident);
            c.setTelefono(telefono);
            c.setDireccion(direccion);
            c.setEmail(email);
            c.setCiudad(ciudad);
            c.setTipoUsuario(tipoUsuario);
            c.setContrasena(contrasena);
            c.setEstado(estado);
            if (c.actualizarContacto()) {
//            if (true) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Usuario sin sesión.
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>


<%--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
--%>