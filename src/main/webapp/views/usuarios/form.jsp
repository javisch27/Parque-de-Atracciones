<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-body">
	<div class="mb-3">
		<label for="nombre" class="col-form-label">Nombre:</label> <input
			type="text" class="form-control" id="nombre" name="nombre" required
			value="${usuario.nombre}">
	</div>
	<div class="mb-3">
		<label for="password"
			class='col-form-label ${usuario.errors.get("password") != null ? "is-invalid" : "" }'>Password:</label>
		<input class="form-control" type="text" id="password" name="password"
			required value="${usuario.password}"></input>
		<div class="invalid-feedback">
			<c:out value='${usuario.errors.get("password")}'></c:out>
		</div>
	</div>

	<div class="mb-3">
		<label for="admin"
			class='col-form-label ${usuario.errors.get("admin") != null ? "is-invalid" : "" }'>Administrador:</label>
		<input class="form-control" type="text" id="admin" name="admin"
			required value="${usuario.admin}"></input>
		<div class="invalid-feedback">
			<c:out value='${usuario.errors.get("admin")}'></c:out>
		</div>
	</div>
	<div class="mb-3">
		<label for="Tipo_Atraccion"
			class='col-form-label ${usuario.errors.get("tipoAtraccionPreferida") != null ? "is-invalid" : "" }'>Tipo
			de atracción:</label> <input class="form-control" type="text"
			id="Tipo_Atraccion" name="Tipo_Atraccion" required
			value="${usuario.tipoAtraccionPreferida}"></input>
		<div class="invalid-feedback">
			<c:out value='${usuario.errors.get("tipoAtraccionPreferida")}'></c:out>
		</div>
	</div>
	<div class="mb-3">
		<label for="presupuestoDisponible"
			class='col-form-label ${usuario.errors.get("presupuestoDisponible") != null ? "is-invalid" : "" }'>Presupuesto:</label>
		<input class="form-control" type="number" id="presupuestoDisponible"
			name="presupuestoDisponible" required
			value="${usuario.presupuestoDisponible}"></input>
		<div class="invalid-feedback">
			<c:out value='${usuario.errors.get("presupuestoDisponible")}'></c:out>
		</div>
	</div>
	<div class="mb-3">
		<label for="tiempoDisponible"
			class='col-form-label ${usuario.errors.get("tiempoDisponible") != null ? "is-invalid" : "" }'>Tiempo:</label>
		<input class="form-control" type="number" id="tiempoDisponible"
			name="tiempoDisponible" required value="${usuario.tiempoDisponible}"></input>
		<div class="invalid-feedback">
			<c:out value='${usuario.errors.get("tiempoDisponible")}'></c:out>
		</div>
	</div>
</div>

<div>
	<button type="submit" class="btn btn-primary">Guardar</button>
	<a onclick="window.history.back();" class="btn btn-secondary"
		role="button">Cancelar</a>
</div>