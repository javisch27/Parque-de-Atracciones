package model;

import java.util.LinkedList;

public class PromoPorcentual extends Promocion {

	private double porcentajeDescuento;

	public PromoPorcentual(TipoAtraccion tipoAtraccion, String titulo, String descrpicion,
			LinkedList<Atraccion> atraccionesIncluidas, double porcentajeDescuento, int id_promocion,  int tipo_promocion_id) {
		super(tipoAtraccion, titulo, descrpicion, atraccionesIncluidas, id_promocion, tipo_promocion_id);
		this.porcentajeDescuento = porcentajeDescuento;
		this.costo = obtenerCosto();
	}

	public int obtenerCosto() {
		return (int) Math.round(getCostoTotalAtracciones(atraccionesIncluidas) * (1 - this.porcentajeDescuento));
	}

	public double getPorcentajeDescuento() {
		return porcentajeDescuento;
	}

	public void setVariable(double porcentajeDescuento) {
		this.porcentajeDescuento = porcentajeDescuento;
	}

	@Override
	public double getVariable() {
		return this.porcentajeDescuento;
	}

}
