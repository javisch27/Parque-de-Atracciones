package model;

import java.util.LinkedList;

import persistence.commons.DAOFactory;
import utils.Crypt;
import persistence.UsuariosDAO;

public class Usuario {
	private TipoAtraccion tipoAtraccionPreferida;
	private int presupuestoDisponible;
	private double tiempoDisponible;
	private String nombre;
	private int usuario_id;
	private LinkedList<Propuesta> propuestasCompradas = new LinkedList<Propuesta>();
	private String password;
	private boolean admin;

	public Usuario(String nombre, String password, boolean admin, TipoAtraccion tipoAtraccionPreferida, int presupuesto, double tiempoMaximo,
			LinkedList<Propuesta> propuestasCompradas, int usuario_id) {
		this.tipoAtraccionPreferida = tipoAtraccionPreferida;
		this.presupuestoDisponible = presupuesto;
		this.tiempoDisponible = tiempoMaximo;
		this.nombre = nombre;
		this.password = password;
		this.admin = admin;
		this.propuestasCompradas = propuestasCompradas;
		this.usuario_id = usuario_id;

	}

	public LinkedList<Propuesta> getPropuestasCompradas() {
		return propuestasCompradas;
	}

	public void setPropuestasCompradas(LinkedList<Propuesta> propuestasCompradas) {
		this.propuestasCompradas = propuestasCompradas;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = Crypt.hash(password);
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public void setTipoAtraccionPreferida(TipoAtraccion tipoAtraccionPreferida) {
		this.tipoAtraccionPreferida = tipoAtraccionPreferida;
	}

	public void setPresupuestoDisponible(int presupuestoDisponible) {
		this.presupuestoDisponible = presupuestoDisponible;
	}

	public void setTiempoDisponible(double tiempoDisponible) {
		this.tiempoDisponible = tiempoDisponible;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setUsuario_id(int usuario_id) {
		this.usuario_id = usuario_id;
	}

	public TipoAtraccion getTipoAtraccionPreferida() {
		return tipoAtraccionPreferida;
	}

	public int getPresupuestoDisponible() {
		return presupuestoDisponible;
	}

	public double getTiempoDisponible() {
		return tiempoDisponible;
	}

	public String getNombre() {
		return nombre;
	}

	public LinkedList<Propuesta> getPropuestasContratadas() {
		return propuestasCompradas;
	}

	public boolean puedeAdquirirPropuesta(Propuesta propuesta) {
		return puedepagarPropuesta(propuesta) && tieneTiempoDisponible(propuesta) && atraccionNoContratada(propuesta);
	}

	public boolean puedepagarPropuesta(Propuesta propuesta) {
		return presupuestoDisponible >= propuesta.getCosto();
	}

	public boolean tieneTiempoDisponible(Propuesta propuesta) {
		return tiempoDisponible >= propuesta.getTiempoUtilizado();
	}

	private boolean atraccionNoContratada(Propuesta propuesta) {
		boolean atraccionNoInculida = true;
		for (Propuesta propuestaContratada : propuestasCompradas) {
			for (Atraccion atraccionContratada : propuestaContratada.getAtraccionesIncluidas())
				atraccionNoInculida &= !propuesta.getAtraccionesIncluidas().contains(atraccionContratada);
		}
		return atraccionNoInculida;
	}

	public void agregarPropuestaAceptada(Propuesta nuevaPropuesta) {
		propuestasCompradas.add(nuevaPropuesta);
		tiempoDisponible -= nuevaPropuesta.getTiempoUtilizado();
		presupuestoDisponible -= nuevaPropuesta.getCosto();
		UsuariosDAO userDAO = DAOFactory.getUserDAO();
		userDAO.update(this);
		userDAO.insertPropuestaContratadas(this, nuevaPropuesta);
	}

	public boolean aceptaPropuesta(Propuesta propuesta) {

		return true;
	}

	public int getUsuario_id() {
		return usuario_id;
	}
	
	public boolean checkPassword(String password) {
		// this.password en realidad es el hash del password
		return Crypt.match(password, this.password);
	}
	
	public boolean isNull() {
		return false;
	}

}
