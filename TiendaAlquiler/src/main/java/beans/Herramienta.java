package beans;

public class Herramienta {
    private int id;
    private String herramienta;
    private String descipcion;
    private float precio;
    private int cantidad;

    public Herramienta(int id, String herramienta, String descipcion, float precio, int cantidad) {
        this.id = id;
        this.herramienta = herramienta;
        this.descipcion = descipcion;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHerramienta() {
        return herramienta;
    }

    public void setHerramienta(String herramienta) {
        this.herramienta = herramienta;
    }

    public String getDescipcion() {
        return descipcion;
    }

    public void setDescipcion(String descipcion) {
        this.descipcion = descipcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public String toString() {
        return "Herramienta{" + "id=" + id + ", herramienta=" + herramienta + ", descipcion=" + descipcion + ", precio=" + precio + ", cantidad=" + cantidad + '}';
    }
    
    
}
