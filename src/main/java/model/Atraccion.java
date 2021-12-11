package model;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import persistence.AtraccionesDAO;
import persistence.commons.DAOFactory;


public class Atraccion extends Propuesta {

	private int cupoDisponible;
	private int cupoInicial;
	private int id_atraccion;
	private String descripcion;
	
	private Map<String, String> errors;

	public Atraccion(int costo, double duracion, TipoAtraccion tipoAtraccion, int cupoMaximo, String nombre, String descripcion,
			int id_atraccion) {
		super(id_atraccion);
		this.costo = costo;
		this.tiempoTotal = duracion;
		this.tipoAtraccion = tipoAtraccion;
		this.cupoDisponible = cupoMaximo;
		this.cupoInicial = cupoMaximo;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.id_atraccion = id_atraccion;
	}
	
	public boolean isValid() {
		validate();
		return errors.isEmpty();
	}

	public void validate() {
		errors = new HashMap<String, String>();

		if (costo <= 0) {
			errors.put("cost", "Debe ser positivo");
		}
		if (tiempoTotal <= 0) {
			errors.put("duration", "Debe ser positivo");
		}
		if (cupoDisponible <= 0) {
			errors.put("capacity", "Debe ser positivo");
		}
	}

	public Map<String, String> getErrors() {
		return errors;
	}

	@Override
	public void actualizarCupoDisponible() {
		cupoDisponible--;
		if (cupoDisponible == 0)
			hayCupoDisponible = false;

		AtraccionesDAO atraccionDAO = DAOFactory.getAtraccionesDAO();
		atraccionDAO.updateCupos(this);
	}

	@Override
	public String toString() {
		String toString = "";
		toString += "- Atracción: " + nombre + "\n";
		toString += "\tTipo de Atracción: " + tipoAtraccion.getNombre() + "\n";
		toString += "\tCosto: " + getCosto() + " créditos galácticos\n";
		toString += "\tDuración de la Atracción: " + ModificadorFormatoHora.obtenerHoraConFormato(getTiempoUtilizado())
				+ "\n\n";

		return toString;

	}

	public LinkedList<Atraccion> getAtraccionesIncluidas() {
		LinkedList<Atraccion> atraccionesIncluidas = new LinkedList<Atraccion>();
		atraccionesIncluidas.add(this);
		return atraccionesIncluidas;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public void setCupoDisponible(int cupoDisponible) {
		this.cupoDisponible = cupoDisponible;
	}

	public void setCupoInicial(int cupoInicial) {
		this.cupoInicial = cupoInicial;
	}

	public int getCupoDisponible() {
		return cupoDisponible;
	}

	public int getCupoInicial() {
		return cupoInicial;
	}

	public int getId_atraccion() {
		return id_atraccion;
	}

	public int setId_atraccion(int id) {
		return id_atraccion = id;
	}

}
