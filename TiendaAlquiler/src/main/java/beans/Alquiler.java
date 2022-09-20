package beans;

import java.sql.Date;

public class Alquiler {
    private int id_compra;
    private int id;
    private String nombre_usuario;
    private Date fecha;
    private int horas;
    private float deposito;

    public Alquiler(int id_compra, int id, String nombre_usuario, Date fecha, int horas, float deposito) {
        this.id_compra = id_compra;
        this.id = id;
        this.nombre_usuario = nombre_usuario;
        this.fecha = fecha;
        this.horas = horas;
        this.deposito = deposito;
    }

    public int getId_compra() {
        return id_compra;
    }

    public void setId_compra(int id_compra) {
        this.id_compra = id_compra;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getHoras() {
        return horas;
    }

    public void setHoras(int horas) {
        this.horas = horas;
    }

    public float getDeposito() {
        return deposito;
    }

    public void setDeposito(float deposito) {
        this.deposito = deposito;
    }
    
    @Override
    public String toString() {
        return "Alquiler{" + "id_compra=" + id_compra + ", id=" + id + ", nombre_usuario=" + nombre_usuario + ", fecha=" + fecha + ", horas=" + horas + ", deposito=" + deposito + '}';
    }
    
    
    
}
