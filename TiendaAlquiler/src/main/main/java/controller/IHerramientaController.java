package controller;

public interface IHerramientaController {

    public String listar(boolean ordenar, String orden);

    public String devolver(int id, String username);

    public String sumarCantidad(int id);

    public String alquilar(int id, String username);

    public String modificar(int id);

}
