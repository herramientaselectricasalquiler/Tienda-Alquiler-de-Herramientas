package controller;

import java.util.Map;

public interface IUsuarioController {

    public String login(String username, String contrasena);

    public String register(String username, String contrasena,
            String nombre, String apellidos, String email, double saldo, String telefono, String direccion);

    public String pedir(String username);

    public String modificar(String username, String nuevaContrasena,
            String nuevoNombre, String nuevosApellidos, String nuevoEmail,
            double nuevoSaldo, String nuevoTelefono, String nuevaDireccion);

    public String verCopias(String username);

    public String devolverHerramientas(String username, Map<Integer, Integer> cantidad);

    public String eliminar(String username);

    public String restarDinero(String username, double nuevoSaldo);

}
