package persistence.commons;

import java.util.List;

public interface GenericDAO<T> {

	public List<T> findAll();

	public abstract int countAll();
	
	public T find(Integer id);

}
