package services;

import java.util.List;

import model.Atraccion;
import model.TipoAtraccion;
import persistence.AtraccionesDAO;
import persistence.commons.DAOFactory;

public class AtraccionService {

	public List<Atraccion> list() {
		return DAOFactory.getAtraccionesDAO().findAll();
	}

	public Atraccion create(int costo, double duracion, TipoAtraccion tipoAtraccion, int cupoMaximo, String nombre, String descripcion) {

		Atraccion atraccion = new Atraccion(costo, duracion, tipoAtraccion, cupoMaximo, nombre, descripcion, -1);

		if (atraccion.isValid()) {
			AtraccionesDAO atraccionDAO = DAOFactory.getAtraccionesDAO();
			atraccionDAO.insert(atraccion);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return atraccion;
	}

	public Atraccion update(int costo, double duracion, TipoAtraccion tipoAtraccion, int cupoMaximo, String nombre, String descripcion,
			int id_atraccion) {

		AtraccionesDAO atraccionDAO = DAOFactory.getAtraccionesDAO();
		Atraccion atraccion = atraccionDAO.find(id_atraccion);

		atraccion.setCosto(costo);
		atraccion.setTiempoTotal(duracion);
		atraccion.setTipoAtraccion(tipoAtraccion);
		atraccion.setCupoDisponible(cupoMaximo);
		atraccion.setNombre(nombre);
		atraccion.setDescripcion(descripcion);

		if (atraccion.isValid()) {
			atraccionDAO.updateCupos(atraccion);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return atraccion;
	}

	public void delete(Integer id) {
		Atraccion atraccion = new Atraccion(0, 0.0, null, 0, "", "", id);

		AtraccionesDAO atraccionDAO = DAOFactory.getAtraccionesDAO();
		atraccionDAO.delete(atraccion);
	}

	public Atraccion find(Integer id) {
		AtraccionesDAO atraccionDAO = DAOFactory.getAtraccionesDAO();
		return atraccionDAO.find(id);
	}


}