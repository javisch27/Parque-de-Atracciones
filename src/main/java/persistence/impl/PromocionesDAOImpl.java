package persistence.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import persistence.AtraccionesDAO;
import persistence.PromocionesDAO;
import persistence.commons.ConnectionProvider;
import persistence.commons.DAOFactory;
import persistence.commons.MissingDataException;
import model.Atraccion;
import model.PromoAbsoluta;
import model.PromoPorcentual;
import model.Promocion;
import model.PromocionAXB;
import model.TipoAtraccion;
import model.Usuario;
import model.nullobjects.NullUsuario;

public class PromocionesDAOImpl implements PromocionesDAO {

	public List<Promocion> findAll() {
		try {
			String sql = "SELECT * FROM PROMOCIONES WHERE  borrado ISNULL";

			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();

			List<Promocion> promociones = new LinkedList<Promocion>();
			while (resultados.next()) {
				promociones.add(toPromocion(resultados));
			}

			return promociones;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public Promocion find(Integer id) {
		try {
			String sql = "SELECT * FROM PROMOCIONES WHERE id = ?  AND borrado ISNULL";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, id);

			ResultSet resultados = statement.executeQuery();

			Promocion promocion = null;
			if (resultados.next()) {
				promocion = toPromocion(resultados);
			}
			return promocion;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	
	
	public Promocion findByName(String nombrePromo) {
		try {
			String sql = "SELECT * FROM PROMOCIONES WHERE NOMBRE = ?  AND borrado ISNULL";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, nombrePromo);
			ResultSet resultados = statement.executeQuery();

			Promocion promocion = null;
		

			if (resultados.next()) {
				promocion = toPromocion(resultados);
			}

			return promocion;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	private Promocion toPromocion(ResultSet resultados) {

		try {
			AtraccionesDAO atraccionesDAO = DAOFactory.getAtraccionesDAO();
			LinkedList<Atraccion> atracciones = atraccionesDAO.encontrarAtraccionesdePromociones(resultados.getInt(1));

			if (resultados.getInt(2) == 1) {
				return toPromoPorcentual(resultados, atracciones);
			} else if (resultados.getInt(2) == 2) {
				return toPromoAbsoluta(resultados, atracciones);
			} else {
				LinkedList<Atraccion> atraccionesGratisAXB = atraccionesDAO
						.encontrarAtraccionesdePromosAXB(resultados.getInt(1));
				return toPromoAXB(resultados, atracciones, atraccionesGratisAXB);
			}
		} catch (Exception e) {
			throw new MissingDataException(e);
		}

	}

	private PromoPorcentual toPromoPorcentual(ResultSet resultados, LinkedList<Atraccion> atracciones) {
		try {
			return new PromoPorcentual(TipoAtraccion.valueOf(resultados.getInt(3)), resultados.getString(4),
					resultados.getString(5), atracciones, resultados.getDouble(6), resultados.getInt(1), resultados.getInt(2));
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	private PromoAbsoluta toPromoAbsoluta(ResultSet resultados, LinkedList<Atraccion> atracciones) {
		try {
			return new PromoAbsoluta(TipoAtraccion.valueOf(resultados.getInt(3)), resultados.getString(4),
					resultados.getString(5), atracciones, resultados.getInt(6), resultados.getInt(1), resultados.getInt(2));
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	private PromocionAXB toPromoAXB(ResultSet resultados, LinkedList<Atraccion> atracciones,
			LinkedList<Atraccion> atraccionesGratis) {
		try {
			return new PromocionAXB(TipoAtraccion.valueOf(resultados.getInt(3)), resultados.getString(4),
					resultados.getString(5), atracciones, atraccionesGratis, resultados.getInt(1), resultados.getInt(2));
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public LinkedList<Promocion> encontrarPromocionesContratadasPorUsuarios(int idUsuario) {
		try {
			String sql =

					"SELECT Promociones.* FROM propuestas_compradas_por_usuarios  "
							+ "JOIN usuarios ON usuarios.id = propuestas_compradas_por_usuarios.id_usuario "
							+ "JOIN promociones ON promociones.id = propuestas_compradas_por_usuarios.id_promocion "
							+ "WHERE usuarios.id = ?";

			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, idUsuario);
			ResultSet resultados = statement.executeQuery();

			LinkedList<Promocion> promociones = new LinkedList<Promocion>();
			while (resultados.next()) {
				promociones.add(toPromocion(resultados));
			}

			return promociones;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}

	}

	public int countAll() {
		try {
			String sql = "SELECT COUNT(1) AS TOTAL FROM PROMOCIONES  WHERE borrado ISNULL";
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

	public int update(Promocion promocion) {
		try {
			String sql = "UPDATE PROMOCIONES SET TIPO_PROMOCION = ?, TIPO_ATRACCIONES = ?, DESCRIPCION = ?, VARIABLE = ? WHERE NOMBRE = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);

			if (promocion.getClass() == PromoPorcentual.class) {
				statement.setInt(1, 1);
				statement.setInt(2, promocion.getTipoAtraccion().getNumeroId());
				statement.setString(3, promocion.getDescripcion());
				statement.setDouble(4, promocion.getVariable());
				statement.setString(5, promocion.getNombre());
			}

			if (promocion.getClass() == PromoAbsoluta.class) {
				statement.setInt(1, 2);
				statement.setInt(2, promocion.getTipoAtraccion().getNumeroId());
				statement.setString(3, promocion.getDescripcion());
				statement.setDouble(4, promocion.getVariable());
				statement.setString(5, promocion.getNombre());
			}

			if (promocion.getClass() == PromocionAXB.class) {
				statement.setInt(1, 3);
				statement.setInt(2, promocion.getTipoAtraccion().getNumeroId());
				statement.setString(3, promocion.getDescripcion());
				statement.setString(5, promocion.getNombre());
				updateAtraccionesDePromosAXB((PromocionAXB)promocion);
			}
			

			int rows = statement.executeUpdate();
			
			
			this.updateAtraccionesDePromociones(promocion);

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	private void updateAtraccionesDePromosAXB(PromocionAXB promocion) {
		deleteAtraccionesDePromosAXB(promocion);
		insertAtraccionesDePromosAXB(promocion);
		
	}

	private int insertAtraccionesDePromosAXB(PromocionAXB promocion) {
		try {
			String sql = "INSERT INTO ATRACCIONES_DE_PROMOS_AXB (ID_PROMOCION, ID_ATRACCION) VALUES (?, ?)";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			int rows = 0;

			for (Atraccion atraccion : promocion.getAtraccionesGratis()) {
				int atraccionID = atraccion.getId_atraccion();
				statement.setInt(1, promocion.getPropuestaID());
				statement.setInt(2, atraccionID);
				
				rows = statement.executeUpdate();
			}
		return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
		
	}

	private int deleteAtraccionesDePromosAXB(Promocion promocion) {
		try {
			String sql = "DELETE FROM ATRACCIONES_DE_PROMOS_AXB WHERE ID_PROMOCION = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, promocion.getPropuestaID());
			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
		
	}

	private void updateAtraccionesDePromociones(Promocion promocion) {

		deleteAtraccionesDePromociones(promocion);
		insertAtraccionesDePromociones(promocion);
	}

	private int deleteAtraccionesDePromociones(Promocion promocion) {
		try {
			String sql = "DELETE FROM ATRACCIONES_DE_PROMOCIONES WHERE ID_PROMOCION = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, promocion.getPropuestaID());
			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}

	}

	private int insertAtraccionesDePromociones(Promocion promocion) {

		try {
			String sql = "INSERT INTO ATRACCIONES_DE_PROMOCIONES (ID_PROMOCION, ID_ATRACCION) VALUES (?, ?)";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			int rows = 0;

			for (Atraccion atraccion : promocion.getAtraccionesIncluidas()) {
				int atraccionID = atraccion.getId_atraccion();
				statement.setInt(1, promocion.getPropuestaID());
				statement.setInt(2, atraccionID);
				
				rows = statement.executeUpdate();
			}
		return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public int insert(Promocion promocion) {
		try {
			String sql = "INSERT INTO PROMOCIONES (TIPO_PROMOCION, TIPO_ATRACCIONES, NOMBRE, DESCRIPCION, VARIABLE) VALUES (?, ?, ?, ?, ?)";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);

			if (promocion.getClass() == PromoPorcentual.class) {
				statement.setInt(1, 1);
				statement.setInt(2, promocion.getTipoAtraccion().getNumeroId());
				statement.setString(3, promocion.getNombre());
				statement.setString(4, promocion.getDescripcion());
				statement.setDouble(5, promocion.getVariable());
			}

			if (promocion.getClass() == PromoAbsoluta.class) {
				statement.setInt(1, 2);
				statement.setInt(2, promocion.getTipoAtraccion().getNumeroId());
				statement.setString(3, promocion.getNombre());
				statement.setString(4, promocion.getDescripcion());
				statement.setDouble(5, promocion.getVariable());
			}

			if (promocion.getClass() == PromocionAXB.class) {
				statement.setInt(1, 3);
				statement.setInt(2, promocion.getTipoAtraccion().getNumeroId());
				statement.setString(3, promocion.getNombre());
				statement.setString(4, promocion.getDescripcion());
				
			}
			
		
			int rows = statement.executeUpdate();
			
			Promocion promoNueva = findByName(promocion.getNombre());
			promocion.setPropuestaID(promoNueva.getPropuestaId());
			
			insertAtraccionesDePromociones(promocion);
			if(promocion.getClass() == PromocionAXB.class) {
				insertAtraccionesDePromosAXB((PromocionAXB)promocion);
			}
			

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public int delete(Promocion promocion) {
		try {

			String sql = "UPDATE PROMOCIONES SET BORRADO = 1  WHERE ID = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, promocion.getPropuestaID());
			int rows = statement.executeUpdate();
			
//			deleteAtraccionesDePromociones(promocion);
//			deleteAtraccionesDePromosAXB(promocion);

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	


}
