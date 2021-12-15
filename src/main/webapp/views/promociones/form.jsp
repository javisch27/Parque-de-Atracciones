<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-body">

	<div class="mb-3">
		<label for="tipoPromocion">Tipo de promoci�n:</label> <input
			class="form-control" type="text" id="tipoPromocion"
			name="tipoPromocion"></input>
	</div>
	<div class="mb-3">
		<label for="tipoAtraccion"
			class='col-form-label ${promocion.errors.get("tipoAtraccion") != null ? "is-invalid" : "" }'>Tipo
			de atracciones:</label> <input class="form-control" type="text"
			id="tipoAtraccion" name="tipoAtraccion" required
			value="${promocion.tipoAtraccion}"></input>
		<div class="invalid-feedback">
			<c:out value='${promocion.errors.get("tipoAtraccion")}'></c:out>
		</div>
	</div>
	<div class="mb-3">
		<label for="nombre" class="col-form-label">Nombre:</label> <input
			type="text" class="form-control" id="nombre" name="nombre" required
			value="${promocion.nombre}">
	</div>
	<div class="mb-3">
		<label for="descripcion"
			class='col-form-label ${promocion.errors.get("descripcion") != null ? "is-invalid" : "" }'>Descripci�n:</label>
		<input class="form-control" type="text" id="descripcion"
			name="descripcion" required value="${promocion.descripcion}"></input>
		<div class="invalid-feedback">
			<c:out value='${promocion.errors.get("descripcion")}'></c:out>
		</div>
	</div>
	<div class="mb-3">
		<label for="atraccionesIncluidas"
			class='col-form-label ${promocion.errors.get("atraccionesIncluidas") != null ? "is-invalid" : "" }'>Atracciones
			incluidas:</label> <input class="form-control" type="text"
			id="atraccionesIncluidas" name="atraccionesIncluidas"></input>
		<div class="invalid-feedback">
			<c:out value='${promocion.errors.get("atraccionesIncluidas")}'></c:out>
		</div>
	</div>
	<div class="mb-3">
		<label for="atraccionesGratisPromoAXB">Atracciones gratis en promociones AXB:</label> <input
			class="form-control" type="text" id="atraccionesGratisPromoAXB"
			name="atraccionesGratisPromoAXB"></input>
	</div>
	<div class="mb-3">
		<label for="variable">Variable:</label> <input
			class="form-control" type="text" id="variable"
			name="variable"></input>
	</div>
</div>
<div>
	<button type="submit" class="btn btn-primary">Guardar</button>
	<a onclick="window.history.back();" class="btn btn-secondary"
		role="button">Cancelar</a>
</div>
