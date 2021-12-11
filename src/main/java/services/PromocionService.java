package services;

import java.util.LinkedList;
import java.util.List;

import model.Atraccion;
import model.Promocion;
import model.TipoAtraccion;
import model.TipoPromocion;
import persistence.PromocionesDAO;
import persistence.commons.DAOFactory;

public class PromocionService {

	public List<Promocion> list() {
		return DAOFactory.getPromocinoesDAO().findAll();
	}

	public Promocion create(TipoPromocion tipoPromocion, TipoAtraccion tipoAtracciones, String nombre, String descripcion, Double variable) {

		Promocion promocion = new Promocion(tipoAtracciones, nombre, descripcion, null, -1);

		if (promocion.isValid()) {
			PromocionesDAO promocionDAO = DAOFactory.getPromocinoesDAO();
			promocionDAO.insert(promocion);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return promocion;
	}

	public Promocion update(Integer id, Integer tipoPromocion, Integer tipoAtracciones, String nombre, String descripcion, Double variable) {

		PromocionesDAO promocionDAO = DAOFactory.getPromocinoesDAO();
		Promocion promocion = promocionDAO.find(id);

		promocion.setTipoPromocion(tipoPromocion);
		promocion.setTipoAtracciones(tipoAtracciones);
		promocion.setNombre(nombre);
		promocion.setDescripcion(descripcion);
		promocion.setVariable(variable);

		if (promocion.isValid()) {
			promocionDAO.update(promocion);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return promocion;
	}

	public void delete(Integer id) {
		Promocion promocion = new Promocion(id, null, null, null, null, null);

		PromocionesDAO promocionDAO = DAOFactory.getPromocinoesDAO();
		promocionDAO.delete(promocion);
	}

	public Promocion find(Integer id) {
		PromocionesDAO promocionDAO = DAOFactory.getPromocinoesDAO();
		return promocionDAO.find(id);
	}

}
