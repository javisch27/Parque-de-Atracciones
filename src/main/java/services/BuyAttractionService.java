package services;

import java.util.HashMap;
import java.util.Map;

import model.Atraccion;
import model.Usuario;
import persistence.AtraccionesDAO;
import persistence.UsuariosDAO;
import persistence.commons.DAOFactory;

public class BuyAttractionService {

	AtraccionesDAO atraccionDAO = DAOFactory.getAtraccionesDAO();
	UsuariosDAO usuarioDAO = DAOFactory.getUserDAO();

	public Map<String, String> buy(Integer usuarioId, Integer atraccionId) {
		Map<String, String> errors = new HashMap<String, String>();

		Usuario usuario = usuarioDAO.find(usuarioId);
		Atraccion atraccion = atraccionDAO.find(atraccionId);

		if (!atraccion.isHayCupoDisponible()) {
			errors.put("atraccion", "No hay cupo disponible");
		}
		if (!usuario.puedepagarPropuesta(atraccion)) {
			errors.put("usuario", "No tienes dinero suficiente");
		}
		if (!usuario.atraccionNoContratada(atraccion)) {
			errors.put("usuario", "Ya esta contratada la Atracción");
		}

		if (errors.isEmpty()) {
			usuario.agregarPropuestaAceptada(atraccion);
			atraccion.actualizarCupoDisponible();

			// no grabamos para no afectar la base de pruebas
			atraccionDAO.updateCupos(atraccion);
			usuarioDAO.update(usuario);
		}

		return errors;

	}

}
