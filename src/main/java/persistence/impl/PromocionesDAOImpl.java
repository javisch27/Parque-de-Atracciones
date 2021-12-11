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

public class PromocionesDAOImpl implements PromocionesDAO {

	public List<Promocion> findAll() {
		try {
			String sql = "SELECT * FROM PROMOCIONES";

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
			String sql = "SELECT * FROM PROMOCIONES WHERE id = ?";
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
					resultados.getString(5), atracciones, resultados.getDouble(6), resultados.getInt(1));
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	private PromoAbsoluta toPromoAbsoluta(ResultSet resultados, LinkedList<Atraccion> atracciones) {
		try {
			return new PromoAbsoluta(TipoAtraccion.valueOf(resultados.getInt(3)), resultados.getString(4),
					resultados.getString(5), atracciones, resultados.getInt(6), resultados.getInt(1));
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	private PromocionAXB toPromoAXB(ResultSet resultados, LinkedList<Atraccion> atracciones,
			LinkedList<Atraccion> atraccionesGratis) {
		try {
			return new PromocionAXB(TipoAtraccion.valueOf(resultados.getInt(3)), resultados.getString(4),
					resultados.getString(5), atracciones, atraccionesGratis, resultados.getInt(1));
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
			String sql = "SELECT COUNT(1) AS TOTAL FROM PROMOCIONES";
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
		return 0;
	}
	
	public int insert(Promocion promocion) {
		return 0;
	}
	
	public int delete(Promocion promocion) {
		try {
			String sql = "DELETE FROM PROMOCIONES WHERE ID = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, promocion.getPropuestaID());
			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

}
