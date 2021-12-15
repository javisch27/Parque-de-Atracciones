package persistence.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import persistence.AtraccionesDAO;
import persistence.PromocionesDAO;
import persistence.UsuariosDAO;
import persistence.commons.ConnectionProvider;
import persistence.commons.DAOFactory;
import persistence.commons.MissingDataException;
import model.Atraccion;
import model.Promocion;
import model.Propuesta;
import model.TipoAtraccion;
import model.Usuario;
import model.nullobjects.NullUsuario;

public class UsuariosDAOImpl implements UsuariosDAO {
	
	public int update(Usuario user) {
		try {
			String sql = "UPDATE USUARIOS SET NOMBRE = ?, PASSWORD = ?, ADMIN = ?, TIPO_ATRACCION = ?, PRESUPUESTO = ?, TIEMPO = ? WHERE ID = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, user.getNombre());
			statement.setString(2, user.getPassword());
			statement.setBoolean(3, user.isAdmin());
			statement.setInt(4, user.getTipoAtraccionPreferida().getNumeroId());
			statement.setInt(5, user.getPresupuestoDisponible());
			statement.setDouble(6, user.getTiempoDisponible());
			statement.setInt(7, user.getUsuario_id());

			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	
	public int updateSinPsw(Usuario user) {
		try {
			String sql = "UPDATE USUARIOS SET NOMBRE = ?,  ADMIN = ?, TIPO_ATRACCION = ?, PRESUPUESTO = ?, TIEMPO = ? WHERE ID = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, user.getNombre());
			statement.setBoolean(2, user.isAdmin());
			statement.setInt(3, user.getTipoAtraccionPreferida().getNumeroId());
			statement.setInt(4, user.getPresupuestoDisponible());
			statement.setDouble(5, user.getTiempoDisponible());
			statement.setInt(6, user.getUsuario_id());

			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	@Override
	public Usuario find(Integer id) {
		try {
			String sql = "SELECT * FROM USUARIOS WHERE id = ?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, id);

			ResultSet resultados = statement.executeQuery();

			Usuario usuario = null;
			if (resultados.next()) {
				usuario = toUser(resultados);
			}
			return usuario;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public Usuario findByUsername(String nombreUsuario) {
		try {
			String sql = "SELECT * FROM USUARIOS WHERE NOMBRE = ?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, nombreUsuario);
			ResultSet resultados = statement.executeQuery();

			Usuario usuario = NullUsuario.build();

			if (resultados.next()) {
				usuario = toUser(resultados);
			}

			return usuario;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public int insertPropuestaContratadas(Usuario user, Propuesta propuesta) {

		try {
			String sql = "INSERT INTO PROPUESTAS_COMPRADAS_POR_USUARIOS (ID_USUARIO, ID_PROMOCION, ID_ATRACCION) VALUES (?, ?, ?)";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);

			statement.setInt(1, user.getUsuario_id());

			if (propuesta.getClass() == Atraccion.class) {
				statement.setInt(3, propuesta.getPropuestaId());

			} else {
				statement.setInt(2, propuesta.getPropuestaId());

			}

			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}

	}

	public List<Usuario> findAll() {
		try {
			String sql = "SELECT * FROM USUARIOS";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();

			List<Usuario> usuarios = new LinkedList<Usuario>();
			while (resultados.next()) {

				usuarios.add(toUser(resultados));
			}

			return usuarios;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	private Usuario toUser(ResultSet resultados) {

		try {
			AtraccionesDAO atraccionesDAO = DAOFactory.getAtraccionesDAO();
			LinkedList<Atraccion> atracciones = atraccionesDAO
					.encontraAtraccionesContratadasPorUsuarios(resultados.getInt(1));

			PromocionesDAO promocionesDAO = DAOFactory.getPromocinoesDAO();
			LinkedList<Promocion> promociones = promocionesDAO
					.encontrarPromocionesContratadasPorUsuarios(resultados.getInt(1));

			LinkedList<Propuesta> propuestasCompradas = new LinkedList<Propuesta>();
			propuestasCompradas.addAll(atracciones);
			propuestasCompradas.addAll(promociones);

			return new Usuario(resultados.getString(2), resultados.getString(6) , resultados.getBoolean(7), TipoAtraccion.valueOf(resultados.getInt(3)),
					resultados.getInt(4), resultados.getDouble(5), propuestasCompradas, resultados.getInt(1));
		} catch (Exception e) {
			throw new MissingDataException(e);
		}

	}

	public int countAll() {
		try {
			String sql = "SELECT COUNT(1) AS TOTAL FROM USUARIOS";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();

			resultados.next();
			int total = resultados.getInt("TOTAL");

			return total;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int delete(Usuario usuario) {
		try {
			String sql = "DELETE FROM USUARIOS WHERE ID = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, usuario.getUsuario_id());
			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int insert(Usuario usuario) {
		try {
			String sql = "INSERT INTO USUARIOS (NOMBRE, TIPO_ATRACCION, PRESUPUESTO, TIEMPO, PASSWORD, ADMIN) VALUES (?, ?, ?, ?, ?, ?)";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, usuario.getNombre());
			statement.setInt(2, usuario.getTipoAtraccionPreferida().getNumeroId());
			statement.setInt(3, usuario.getPresupuestoDisponible());
			statement.setDouble(4, usuario.getTiempoDisponible());
			statement.setString(5, usuario.getPassword());
			statement.setBoolean(6, usuario.isAdmin());
			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
}
