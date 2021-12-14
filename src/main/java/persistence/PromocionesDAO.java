package persistence;

import java.util.LinkedList;

import model.Promocion;
import persistence.commons.GenericDAO;

public interface PromocionesDAO extends GenericDAO<Promocion> {

	public abstract LinkedList<Promocion> encontrarPromocionesContratadasPorUsuarios(int idUsuario);

	public abstract int insert(Promocion promocion);
	
	public abstract int update(Promocion promocion);
	
	public abstract int delete(Promocion promocion);
}
