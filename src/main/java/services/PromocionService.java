package services;

import java.util.LinkedList;
import java.util.List;

import model.Atraccion;
import model.PromoAbsoluta;
import model.PromoPorcentual;
import model.Promocion;
import model.PromocionAXB;
import model.TipoAtraccion;
import model.TipoPromocion;
import persistence.PromocionesDAO;
import persistence.commons.DAOFactory;

public class PromocionService {

	public List<Promocion> list() {
		return DAOFactory.getPromocinoesDAO().findAll();
	}

	public Promocion create(TipoPromocion tipoPromocion, TipoAtraccion tipoAtracciones, String nombre,
			String descripcion, LinkedList<Atraccion> atraccionesIncluidas,
			LinkedList<Atraccion> atraccionesGratisPromoAXB, double variable) {

		Promocion promocion = null;

		if (tipoPromocion == TipoPromocion.PORCENTUAL) {
			promocion = new PromoPorcentual(tipoAtracciones, nombre, descripcion, atraccionesIncluidas, variable, -1);
		}

		if (tipoPromocion == TipoPromocion.ABSOLUTA) {
			promocion = new PromoAbsoluta(tipoAtracciones, nombre, descripcion, atraccionesIncluidas, (int) (variable),
					-1);
		}

		if (tipoPromocion == TipoPromocion.AXB) {
			promocion = new PromocionAXB(tipoAtracciones, nombre, descripcion, atraccionesIncluidas,
					atraccionesGratisPromoAXB, -1);
		}

		if (promocion.isValid()) {
			PromocionesDAO promocionDAO = DAOFactory.getPromocinoesDAO();
			promocionDAO.insert(promocion);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return promocion;
	}

	public Promocion update(TipoPromocion tipoPromocion, TipoAtraccion tipoAtracciones, String nombre,
			String descripcion, LinkedList<Atraccion> atraccionesIncluidas,
			LinkedList<Atraccion> atraccionesGratisPromoAXB, double variable, Integer id) {

		PromocionesDAO promocionDAO = DAOFactory.getPromocinoesDAO();

		if (tipoPromocion == TipoPromocion.PORCENTUAL) {
			PromoPorcentual promocion = (PromoPorcentual) promocionDAO.find(id);
			promocion.setTipoAtraccion(tipoAtracciones);
			promocion.setNombre(nombre);
			promocion.setDescrpicion(descripcion);
			promocion.setAtraccionesIncluidas(atraccionesIncluidas);
			promocion.setVariable(variable);
			
			if (promocion.isValid()) {
				promocionDAO.update(promocion);
				// XXX: si no devuelve "1", es que hubo más errores
			}

			return promocion;
		}

		if (tipoPromocion == TipoPromocion.ABSOLUTA) {
			PromoAbsoluta promocion = (PromoAbsoluta) promocionDAO.find(id);
			promocion.setTipoAtraccion(tipoAtracciones);
			promocion.setNombre(nombre);
			promocion.setDescrpicion(descripcion);
			promocion.setAtraccionesIncluidas(atraccionesIncluidas);
			promocion.setVariable(variable);
			
			if (promocion.isValid()) {
				promocionDAO.update(promocion);
				// XXX: si no devuelve "1", es que hubo más errores
			}

			return promocion;
		}
		
		if (tipoPromocion == TipoPromocion.AXB) {
			PromocionAXB promocion = (PromocionAXB) promocionDAO.find(id);
			promocion.setTipoAtraccion(tipoAtracciones);
			promocion.setNombre(nombre);
			promocion.setDescrpicion(descripcion);
			promocion.setAtraccionesIncluidas(atraccionesIncluidas);
			promocion.setAtraccionesGratis(atraccionesGratisPromoAXB);
			
			if (promocion.isValid()) {
				promocionDAO.update(promocion);
				// XXX: si no devuelve "1", es que hubo más errores
			}

			return promocion;
		}
		
		return null;
	}

	public void delete(Integer id) {
		Promocion promocion = this.find(id);
		
		if (promocion.getClass() == PromoPorcentual.class) {
			promocion = new PromoPorcentual(null, "", "", null, 0.0, id);
		}
		
		if (promocion.getClass() == PromoAbsoluta.class) {
			promocion = new PromoAbsoluta(null, "", "", null, 0, id);
		}
		
		if (promocion.getClass() == PromocionAXB.class) {
			promocion = new PromocionAXB(null, "", "", null, null, id);
		}

		PromocionesDAO promocionDAO = DAOFactory.getPromocinoesDAO();
		promocionDAO.delete(promocion);
	}

	public Promocion find(Integer id) {
		PromocionesDAO promocionDAO = DAOFactory.getPromocinoesDAO();
		return promocionDAO.find(id);
	}

}
