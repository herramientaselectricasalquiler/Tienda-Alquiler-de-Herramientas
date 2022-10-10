package beans;

import java.sql.Date;

public class Alquiler {
    
    private int id;
    private String username;
    private Date fecha;

    public Alquiler(int id, String username, Date fecha) {
        this.id = id;
        this.username = username;
        this.fecha = fecha;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "Alquiler{" + "id=" + id + ", username=" + username + ", fecha=" + fecha + '}';
    }
    
    

    
    
}
