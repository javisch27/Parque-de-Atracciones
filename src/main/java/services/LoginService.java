package services;

import model.Usuario;
import model.nullobjects.NullUsuario;
import persistence.UsuariosDAO;
import persistence.commons.DAOFactory;

public class LoginService {

	public Usuario login(String nombreUsuario, String password) {
		UsuariosDAO userDao = DAOFactory.getUserDAO();
    	Usuario usuario = userDao.findByUsername(nombreUsuario);
    	
    	if (usuario.isNull() || !usuario.checkPassword(password)) {
    		usuario = NullUsuario.build();
    	}
    	return usuario;
	}
	
}
