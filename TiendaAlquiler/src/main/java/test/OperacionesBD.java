package test;
import beans.Herramienta;
import connection.DBConnection;
import java.sql.ResultSet;
import java.sql.Statement;

public class OperacionesBD {
    public static void main(String[] args) {
        actualizarHerramienta(1,"Trupper 650W, 120v");
        listarHerramienta();
    }
    public static void actualizarHerramienta(int id, String descripcion) {
        DBConnection con = new DBConnection();
        String sql = "UPDATE herramienta SET descripcion = '"+descripcion+"'WHERE id = "+id;
        try {
            Statement st = con.getConnection().createStatement();
            st.executeUpdate(sql);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        finally{
            con.desconectar();
        }
    }
    public static void listarHerramienta() {
        DBConnection con = new DBConnection();
        String sql = "SELECT * FROM herramienta";
        try {
            Statement st = con.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                int id = rs.getInt("id");
                String herramienta = rs.getString("herramienta");
                String descripcion = rs.getString("descripcion");;
                float precio = rs.getFloat("precio");;
                int cantidad = rs.getInt("cantidad");
                
                
                Herramienta herramientas = new Herramienta(id,herramienta, descripcion, precio, cantidad);
                System.out.println(herramientas.toString());
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        finally{
            con.desconectar();
        }
    }
}
