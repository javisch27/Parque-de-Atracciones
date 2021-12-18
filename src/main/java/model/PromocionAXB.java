	package model;

import java.util.LinkedList;

public class PromocionAXB extends Promocion {

	private LinkedList<Atraccion> atraccionesGratis = new LinkedList<Atraccion>();

	public PromocionAXB(TipoAtraccion tipoAtraccion, String titulo, String descrpicion,
			LinkedList<Atraccion> atraccionesIncluidas, LinkedList<Atraccion> atraccionesGratis, int id_promocion, int tipo_promocion_id ) {
		super(tipoAtraccion, titulo, descrpicion, atraccionesIncluidas, id_promocion, tipo_promocion_id);
		this.atraccionesGratis = atraccionesGratis;
		this.costo = obtenerCosto();
	}

	private int obtenerCosto() {
		return getCostoTotalAtracciones(atraccionesIncluidas) - getCostoTotalAtracciones(atraccionesGratis);
	}

	public LinkedList<Atraccion> getAtraccionesGratis() {
		return atraccionesGratis;
	}

	public void setAtraccionesGratis(LinkedList<Atraccion> atraccionesGratis) {
		this.atraccionesGratis = atraccionesGratis;
	}

	@Override
	public double getVariable() {
		return 0;
	}
}
