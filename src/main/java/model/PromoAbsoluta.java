package model;

import java.util.LinkedList;

public class PromoAbsoluta extends Promocion {
	protected int tipo_promocion_id = 1;

	public PromoAbsoluta(TipoAtraccion tipoAtraccion, String titulo, String descrpicion,
			LinkedList<Atraccion> atraccionesIncluidas, int costoPromo, int id_promocion, int tipo_promocion_id) {
		super(tipoAtraccion, titulo, descrpicion, atraccionesIncluidas, id_promocion, tipo_promocion_id);
		this.costo = costoPromo;
	}

	public void setVariable(double variable) {
		this.costo = (int)(variable);
		
	}

	@Override
	public double getVariable() {
		return this.costo;
	}

}
