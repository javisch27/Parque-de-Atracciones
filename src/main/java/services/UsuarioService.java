package services;

import java.util.List;

import model.Usuario;
import model.TipoAtraccion;
import persistence.UsuariosDAO;
import persistence.commons.DAOFactory;

public class UsuarioService {

	public List<Usuario> list() {
		return DAOFactory.getUserDAO().findAll();
	}

	public Usuario create(String nombre, String password, boolean admin, TipoAtraccion tipoAtraccionPreferida, int presupuesto, double tiempoMaximo) {

		Usuario usuario = new Usuario(nombre, password, admin, tipoAtraccionPreferida, presupuesto, tiempoMaximo, null, -1);

		if (usuario.isValid()) {
			UsuariosDAO usuarioDAO = DAOFactory.getUserDAO();
			usuarioDAO.insert(usuario);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return usuario;
	}

	public Usuario update(String password, boolean admin, TipoAtraccion tipoAtraccion, int presupuesto, double tiempoMaximo, int usuario_id) {

		UsuariosDAO usuarioDAO = DAOFactory.getUserDAO();
		Usuario usuario = usuarioDAO.find(usuario_id);

		usuario.setPassword(password);
		usuario.setAdmin(admin);
		usuario.setTipoAtraccionPreferida(tipoAtraccion);
		usuario.setPresupuestoDisponible(presupuesto);
		usuario.setTiempoDisponible(tiempoMaximo);

		if (usuario.isValid()) {
			usuarioDAO.update(usuario);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return usuario;
	}

	public void delete(Integer usuario_id) {
		Usuario usuario = new Usuario("", "", false, null, 0, 0.0, null, usuario_id);

		UsuariosDAO usuarioDAO = DAOFactory.getUserDAO();
		usuarioDAO.delete(usuario);
	}

	public Usuario find(Integer id) {
		UsuariosDAO usuarioDAO = DAOFactory.getUserDAO();
		return usuarioDAO.find(id);
	}

}