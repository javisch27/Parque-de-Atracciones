package model;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import persistence.commons.MissingDataException;
import persistence.commons.ConnectionProvider;

public abstract class Ofertador {


	
	public static List<Atraccion> ordenarAtracciones(List<Atraccion> atracciones, TipoAtraccion tipoAtraccion) {

		
		List<Atraccion> atraccionesFiltradas = new ArrayList<Atraccion>();
		List<Atraccion> restoAtracciones = new ArrayList<Atraccion>();

		for (Atraccion atraccion : atracciones) {
			if (atraccion.getTipoAtraccion().equals(tipoAtraccion)) {
				atraccionesFiltradas.add(atraccion);
			} else {
				restoAtracciones.add(atraccion);
			}
		}

		Collections.sort(atraccionesFiltradas);
		Collections.sort(restoAtracciones);
		atraccionesFiltradas.addAll(restoAtracciones);
		
		

		return atraccionesFiltradas;
	}
	
	public static List<Promocion> ordenarPromocinoes(List<Promocion> promociones, TipoAtraccion tipoAtraccion) {

		
		List<Promocion> promocionesFiltradas = new ArrayList<Promocion>();
		List<Promocion> restoPromocinoes = new ArrayList<Promocion>();

		for (Promocion promocion : promociones) {
			if (promocion.getTipoAtraccion().equals(tipoAtraccion)) {
				promocionesFiltradas.add(promocion);
			} else {
				restoPromocinoes.add(promocion);
			}
		}

		Collections.sort(promocionesFiltradas);
		Collections.sort(restoPromocinoes);
		promocionesFiltradas.addAll(restoPromocinoes);
		
		

		return promocionesFiltradas;
	}
	
	

	private static void propuestaAceptada(Usuario usuario, Propuesta propuesta) {
		usuario.agregarPropuestaAceptada(propuesta);
		propuesta.actualizarCupoDisponible();

	}

	private static void propuestaRechazada(Propuesta propuesta) {

	}

}
