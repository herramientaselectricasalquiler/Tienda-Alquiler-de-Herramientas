package controller;

import java.sql.ResultSet;
import java.sql.Statement;
import com.google.gson.Gson;
import beans.Usuario;
import connection.DBConnection;

public class UsuarioController implements IUsuarioController {

    @Override
    public String login(String nombre_usuario, String contraseña) {
        Gson gson = new Gson();
        DBConnection con = new DBConnection();
        String sql = "SELECT * FROM usuasio WHERE username = '"
                + nombre_usuario + "' and contrasena = '" + contraseña + "'";
        try {
            Statement st = con.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                String nombre = rs.getString("nombre");
                String apellidos = rs.getString("apellidos");
                String email = rs.getString("email");
                double saldo = rs.getDouble("saldo");
                String telefono = rs.getString("telefono");
                String direccion = rs.getString("direccion");
                Usuario usuario = new Usuario(nombre_usuario, contraseña, nombre,
                        apellidos, email, saldo, telefono, direccion);
                return gson.toJson(usuario);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        finally{
            con.desconectar();
        }
        return "false";
    }

}

