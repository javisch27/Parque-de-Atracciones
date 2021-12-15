package persistence;

import model.Propuesta;
import model.Usuario;
import persistence.commons.GenericDAO;

public interface UsuariosDAO extends GenericDAO<Usuario> {

	public abstract int update(Usuario usuario);

	public abstract int insertPropuestaContratadas(Usuario user, Propuesta propuesta);
	
	public abstract Usuario findByUsername(String nombreUsuario);
	
	public abstract int delete(Usuario usuario);
	
	public abstract int insert(Usuario usuario);

	public abstract int updateSinPsw(Usuario usuario);
}

