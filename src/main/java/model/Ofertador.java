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

	private static List<Propuesta> ordenarPropuestas(LinkedList<Propuesta> propuestas, TipoAtraccion tipoAtraccion) {

		List<Propuesta> propuestasFiltradas = new ArrayList<Propuesta>();
		List<Propuesta> restoPropuestas = new ArrayList<Propuesta>();

		for (Propuesta propuesta : propuestas) {
			if (propuesta.getTipoAtraccion() == tipoAtraccion) {
				propuestasFiltradas.add(propuesta);
			} else {
				restoPropuestas.add(propuesta);
			}
		}

		Collections.sort(propuestasFiltradas);
		Collections.sort(restoPropuestas);
		propuestasFiltradas.addAll(restoPropuestas);

		return propuestasFiltradas;
	}

	private static void propuestaAceptada(Usuario usuario, Propuesta propuesta) {
		usuario.agregarPropuestaAceptada(propuesta);
		propuesta.actualizarCupoDisponible();

	}

	private static void propuestaRechazada(Propuesta propuesta) {

	}

}
