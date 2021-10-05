/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.Conexion;

/**
 *
 * @author rodriguezprr
 */
public class Contacto {
    private int idUsuario;
    private int numeroIdentificacion;
    private String nombre;
    private String apellido;
    private String genero;
    private String tipoIdentificacion;
    private String telefono;
    private String direccion;
    private String email;
    
    private String ciudad;
    private String tipoUsuario;
    private String contrasena;
    private String estado;
    
    public Contacto(){
    }
    
    public Contacto getContacto(int identificacion) throws SQLException {
        this.numeroIdentificacion = identificacion;
        return this.getContacto();
    }
    
    public int getIdUsuario(){
        return this.idUsuario;
    }
    
    public void setIdUsuario(int idUsuario){
        this.idUsuario = idUsuario;
    }
    
    public int getIdentificacion(){
        return this.numeroIdentificacion;
    }
    
    public void setIdentificacion(int identificacion){
        this.numeroIdentificacion = identificacion;
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre ;
    }
    
    public String getApellido(){
        return this.apellido;
    }
    
    public void setApellido(String apellido){
        this.apellido = apellido ;
    }
    
    public String getGenero(){
        return this.genero;
    }
    
    public void setGenero(String genero){
        this.genero = genero ;
    }
    
    public String getTipoIdentificacion(){
        return this.tipoIdentificacion;
    }
    
    public void setTipoIdentificacion(String tipoIdentificacion){
        this.tipoIdentificacion = tipoIdentificacion ;
    }
    
    public String getTelefono(){
        return this.telefono;
    }
    
    public void setTelefono(String telefono){
        this.telefono = telefono ;
    }
    
    public String getDirección(){
        return this.direccion;
    }
    
    public void setDireccion(String direccion){
        this.direccion = direccion ;
    }
    
    public String getEmail(){
        return this.email;
    }
    
    public void setEmail(String email){
        this.email = email ;
    }
    
    public String getCiudad(){
        return this.ciudad;
    }
    
    public void setCiudad(String ciudad){
        this.ciudad = ciudad ;
    }

    public String getTipoUsuario(){
        return this.tipoUsuario;
    }
    
    public void setTipoUsuario(String tipoUsuario){
        this.tipoUsuario = tipoUsuario ;
    }
    
    public String getContrasena(){
        return this.contrasena;
    }
    
    public void setContrasena(String contrasena){
        this.contrasena = contrasena ;
    }
    
    public String getEstado(){
        return this.estado;
    }
    
    public void setEstado(String estado){
        this.estado = estado ;
    }
    
    public boolean guardarContacto(){
        Conexion conexion = new Conexion();
        String sentencia= "INSERT INTO Contactos(idUsuario, numeroIdentificacion, nombre, apellido, genero, tipoIdentificacion, telefono, direccion, email, ciudad, tipoUsuario, contrasena, estado) "
                + " VALUES ( '" + this.idUsuario + "','" + this.numeroIdentificacion + "','" + this.nombre + "',"
                + "'" + this.apellido + "','" + this.genero + "','" + this.tipoIdentificacion + "',"
                + "'" + this.telefono + "','" + this.direccion + "','" + this.email 
                + "','" + this.ciudad + "','" + this.tipoUsuario + "','" + this.contrasena + "','" + this.estado +  "');  ";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        }else{
            conexion.cerrarConexion();
            return false;
        }
    }
    
    public boolean borrarContacto(int identificacion){
        String Sentencia = "DELETE FROM Contactos WHERE identificacion='" + identificacion + "'";
        Conexion conexion = new Conexion();
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(Sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }
    
    public boolean actualizarContacto(){
        Conexion conexion = new Conexion();
        String Sentencia = "UPDATE Contactos SET nombre='" + this.nombre + "',apellido'" + this.apellido
                + "',genero='" + this.genero
                + "',tipoIdentificacion=" + this.tipoIdentificacion + "',telefono='" + this.telefono
                + "',direccion='" + this.direccion + "',email='" + this.email
                + "',ciudad='" + this.ciudad + "',tipoUsuario='" + this.tipoUsuario + "',contrasena='" + this.contrasena + "',estado='" + this.estado
                + "' WHERE identificacion=" +this.numeroIdentificacion + ";";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(Sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        }else {
            conexion.cerrarConexion();
            return false;
        }
    }
    
    public List<Contacto> listarContactos(){
        List<Contacto> listaContactos = new ArrayList<>();
        Conexion conexion = new Conexion();
        String sql = "SELECT * FROM Contactos";
        try{
            ResultSet rs = conexion.consultarBD(sql);
            Contacto c;
            while (rs.next()) {
                c = new Contacto();
                c.setIdUsuario(rs.getInt("idUsuario"));
                c.setIdentificacion(rs.getInt("numeroIdentificacion"));
                c.setNombre(rs.getString("nombre"));
                c.setApellido(rs.getString("apellido"));
                c.setGenero(rs.getString("genero"));
                c.setTipoIdentificacion(rs.getString("tipoIdentificacion"));
                c.setTelefono(rs.getString("telefono"));
                c.setDireccion(rs.getString("direccion"));
                c.setEmail(rs.getString("email"));
                c.setCiudad(rs.getString("ciudad"));
                c.setTipoUsuario(rs.getString("tipoUsuario"));
                c.setContrasena(rs.getString("contrasena"));
                c.setEstado(rs.getString("estado"));
                
                listaContactos.add(c);
            }
        }catch(SQLException ex){
            System.out.println("Error:" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaContactos;
    }
    
    public Contacto getContacto() throws SQLException {
        Conexion conexion = new Conexion();
        String sql = "select * from Contactos where identificacion='" + this.numeroIdentificacion + "'";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.idUsuario = rs.getInt("idUsuario");
            this.numeroIdentificacion = rs.getInt("numeroIdentificacion");
            this.nombre = rs.getString("nombre");
            this.apellido = rs.getString("apellido");
            this.genero = rs.getString("genero");
            this.tipoIdentificacion = rs.getString("tipoIdentificacion");
            this.telefono = rs.getString("telefono");
            this.direccion = rs.getString("direccion");
            this.email = rs.getString("email");
            this.ciudad = rs.getString("ciudad");
            this.tipoUsuario = rs.getString("tipoUsuario");
            this.contrasena = rs.getString("contrasena");
            this.estado = rs.getString("estado");
            
            conexion.cerrarConexion();
            return this;

        } else {
            conexion.cerrarConexion();
            return null;
        }

    }
    
    @Override
    public String toString() {
        return "Contacto{" + "idUsuario=" + idUsuario + "identificacion=" + numeroIdentificacion + ", nombre=" + nombre + ", apellido=" + apellido + 
                ", genero=" + genero + ", tipoIdentificacion=" + tipoIdentificacion + ", telefono=" + telefono + 
                ", direccion=" + direccion + ", correo=" + email 
                + ", ciudad=" + ciudad + ", tipoUsuario=" + tipoUsuario + ", contrasena=" + contrasena + ", estado=" + estado + '}';
    }
    
}
