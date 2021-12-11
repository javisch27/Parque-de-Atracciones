<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-body">
	<div class="mb-3">
		<label for="name" class="col-form-label">Nombre:</label> <input
			type="text" class="form-control" id="name" name="name"
			required value="${atraccion.nombre}">
	</div>
	<div class="mb-3">
		<label for="cost"
			class='col-form-label ${atraccion.errors.get("costo") != null ? "is-invalid" : "" }'>Costo:</label>
		<input class="form-control" type="number" id="cost" name="cost"
			required value="${atraccion.costo}"></input>
		<div class="invalid-feedback">
			<c:out value='${atraccion.errors.get("costo")}'></c:out>
		</div>
	</div>
	<div class="mb-3">
		<label for="tiempoTotal"
			class='col-form-label ${atraccion.errors.get("tiempoTotal") != null ? "is-invalid" : "" }'>Duration:</label>
		<input class="form-control" type="number" id="tiempoTotal" name="tiempoTotal"
			required value="${atraccion.tiempoTotal}"></input>
		<div class="invalid-feedback">
			<c:out value='${atraccion.errors.get("tiempoTotal")}'></c:out>
		</div>
	</div>
	<div class="mb-3">
		<label for="cupoInicial"
			class='col-form-label ${atraccion.errors.get("cupoInicial") != null ? "is-invalid" : "" }'>Capacity:</label>
		<input class="form-control" type="number" id="cupoInicial" name="cupoInicial"
			required value="${atraccion.cupoInicial}"></input>
		<div class="invalid-feedback">
			<c:out value='${atraccion.errors.get("cupoInicial")}'></c:out>
		</div>
	</div>
	<div class="mb-3">
		<label for="Tipo_Atraccion"
			class='col-form-label ${atraccion.errors.get("tipoAtraccion") != null ? "is-invalid" : "" }'>Tipo de atracción:</label>
		<input class="form-control" type="text" id="Tipo_Atraccion" name="Tipo_Atraccion"
			required value="${atraccion.tipoAtraccion}"></input>
		<div class="invalid-feedback">
			<c:out value='${atraccion.errors.get("tipoAtraccion")}'></c:out>
		</div>
	</div>
	<div class="mb-3">
		<label for="descripcion"
			class='col-form-label ${atraccion.errors.get("descripcion") != null ? "is-invalid" : "" }'>Descripción:</label>
		<input class="form-control" type="text" id="descripcion" name="descripcion"
			required value="${atraccion.descripcion}"></input>
		<div class="invalid-feedback">
			<c:out value='${atraccion.errors.get("descripcion")}'></c:out>
		</div>
	</div>
</div>
<div>
	<button type="submit" class="btn btn-primary">Guardar</button>
	<a onclick="window.history.back();" class="btn btn-secondary"
		role="button">Cancelar</a>
</div>
