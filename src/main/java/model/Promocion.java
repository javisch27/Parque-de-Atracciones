package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public abstract class Promocion extends Propuesta {
	protected int tipo_promocion_id;
	protected String descrpicion;
	private int cupoDisponible;
	protected LinkedList<Atraccion> atraccionesIncluidas = new LinkedList<Atraccion>();
	
	private Map<String, String> errors;

	public Promocion(TipoAtraccion tipoAtraccion, String titulo, String descrpicion,
			LinkedList<Atraccion> atraccionesIncluidas, int id_promocion) {
		super(id_promocion);
		this.tipoAtraccion = tipoAtraccion;
		this.nombre = titulo;
		this.descrpicion = descrpicion;
		this.atraccionesIncluidas = atraccionesIncluidas;
		this.tiempoTotal = tiempoUtilizado();

	}

	public LinkedList<Atraccion> getAtraccionesIncluidas() {
		return atraccionesIncluidas;
	}

	public String getDescripcion() {
		return this.descrpicion;
	}

	@Override
	public String toString() {
		String toString = "";
		toString += "- " + nombre + ": " + descrpicion + "\n\n";
		toString += "\tTipo de Atracción: " + tipoAtraccion.getNombre() + "\n";
		toString += "\tCosto: " + getCosto() + " créditos galácticos\n";
		toString += "\tDuración Total: " + ModificadorFormatoHora.obtenerHoraConFormato(getTiempoUtilizado()) + "\n\n";

		return toString;
	}

	private double tiempoUtilizado() {
		double tiempoTotal = 0;
		for (Atraccion atraccion : atraccionesIncluidas) {
			tiempoTotal += atraccion.getTiempoUtilizado();
		}
		return tiempoTotal;
	}
	
	public int getCupo() {
		List<Integer> cupos = new ArrayList<>();
		
		for (Atraccion atraccion : atraccionesIncluidas) {
			cupos.add(atraccion.getCupoDisponible());
		}
		return Collections.min(cupos); 
	}
	

	public int getTipoPromocionID() {
		return tipo_promocion_id;
	}

	protected int getCostoTotalAtracciones(LinkedList<Atraccion> listadoAtracciones) {
		int costoTotal = 0;
		for (Atraccion atraccion : listadoAtracciones) {
			costoTotal += atraccion.getCosto();
		}
		return costoTotal;
	}

	@Override
	public void actualizarCupoDisponible() {
		for (Atraccion atraccion : atraccionesIncluidas) {
			atraccion.actualizarCupoDisponible();
			hayCupoDisponible &= atraccion.hayCupoDisponible();
		}
	}

	@Override
	public boolean hayCupoDisponible() {
		for (Atraccion atraccion : atraccionesIncluidas) {
			hayCupoDisponible &= atraccion.hayCupoDisponible();
		}
		return hayCupoDisponible;
	}

	public int getTipo_promocion_id() {
		return tipo_promocion_id;
	}

	public void setTipo_promocion_id(int tipo_promocion_id) {
		this.tipo_promocion_id = tipo_promocion_id;
	}

	public String getDescrpicion() {
		return descrpicion;
	}

	public void setDescrpicion(String descrpicion) {
		this.descrpicion = descrpicion;
	}

	public void setAtraccionesIncluidas(LinkedList<Atraccion> atraccionesIncluidas) {
		this.atraccionesIncluidas = atraccionesIncluidas;
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
	}

	public Map<String, String> getErrors() {
		return errors;
	}

}
