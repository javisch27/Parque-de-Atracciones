package services;

import java.util.HashMap;
import java.util.Map;

import model.Promocion;
import model.Usuario;
import persistence.PromocionesDAO;
import persistence.UsuariosDAO;
import persistence.commons.DAOFactory;

public class BuyPromocionService {

	PromocionesDAO promocionDAO = DAOFactory.getPromocinoesDAO();
	UsuariosDAO userDAO = DAOFactory.getUserDAO();

	public Map<String, String> buy(Integer userId, Integer promocionId) {
		Map<String, String> errors = new HashMap<String, String>();

		Usuario usuario = userDAO.find(userId);
		Promocion promocion = promocionDAO.find(promocionId);

		if (!promocion.hayCupoDisponible()) {
			errors.put("promocion", "No hay cupo disponible");
		}
		if (!usuario.puedepagarPropuesta(promocion)) {
			errors.put("usuario", "No tienes dinero suficiente");
		}
		if (!usuario.tieneTiempoDisponible(promocion)) {
			errors.put("usuario", "No tienes tiempo suficiente");
		}
		if (!usuario.tieneTiempoDisponible(promocion)) {
			errors.put("usuario", "No tienes tiempo suficiente");
		}

		if (errors.isEmpty()) {
			usuario.agregarPropuestaAceptada(promocion);
			promocion.actualizarCupoDisponible();

			// no grabamos para no afectar la base de pruebas
			promocionDAO.update(promocion);
			userDAO.update(usuario);
		}

		return errors;

	}
}
