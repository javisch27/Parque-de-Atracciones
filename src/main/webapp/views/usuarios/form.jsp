
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal-body">
	<form>
		<div class="row g-3">
			<div class="col-md-4 mb-3">
				<label for="nombre" class="col-form-label">Nombre:</label> <input
					type="text" class="form-control" id="nombre" name="nombre" required
					value="${usuario.nombre}">
			</div>
			
			<div class=" col-md-4 mb-3">
				<label for="password"
					class='col-form-label ${usuario.errors.get("password") != null ? "is-invalid" : "" }'>Password:</label>
				<input class="form-control" type="text" id="password"
					name="password"   placeholder="completar solo para cambiar contraseña"></input>
				<div class="invalid-feedback">
					<c:out value='${usuario.errors.get("password")}'></c:out>
				</div>
			</div>


				<div class="col-md-2 mb-3 pt-3">
				<label for="admin"
					class='col-form-label ${usuario.errors.get("admin") != null ? "is-invalid" : "" }'></label>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="admin" name="admin" value="admin" > <label class="form-check-label" for="admin">
						Administrador </label>
				</div>
				<div class="invalid-feedback">
					<c:out value='${usuario.errors.get("admin")}'></c:out>
				</div>
			</div>

		</div>



		<div class="col-md-4 mb-3">
			<label for="tipoAtraccionPreferida"
				class='col-form-label ${usuario.errors.get("tipoAtraccionPreferida") != null ? "is-invalid" : "" }'>Tipo
				de atracción:</label> <select class="form-select"
				id="tipoAtraccionPreferida" name="tipoAtraccionPreferida" required>

				<option
					<c:if test="${usuario.tipoAtraccionPreferida == null }"> selected</c:if>
					value="">Seleccionar...</option>
				<option
					<c:if test="${usuario.tipoAtraccionPreferida == 'LADO_LUMINOSO' }"> selected</c:if>
					value="LADO_LUMINOSO">Lado Luminoso</option>
				<option
					<c:if test="${usuario.tipoAtraccionPreferida == 'LADO_OSCURO' }"> selected</c:if>
					value="LADO_OSCURO">Lado Oscuro</option>
			</select>
			<div class="invalid-feedback">
				<c:out value='${usuario.errors.get("tipoAtraccionPreferida")}'></c:out>
			</div>
		</div>


		<div class="row g-3">
			<div class="col-md-2 mb-3">
				<label for="presupuestoDisponible"
					class='col-form-label ${usuario.errors.get("presupuestoDisponible") != null ? "is-invalid" : "" }'>Presupuesto:</label>
				<input class="form-control" type="number" id="presupuestoDisponible"
					name="presupuestoDisponible" required min="0"
					value="${usuario.presupuestoDisponible}"></input>
				<div class="invalid-feedback">
					<c:out value='${usuario.errors.get("presupuestoDisponible")}'></c:out>
				</div>
			</div>


			<div class="col-md-2  mb-3">
				<label for="tiempoDisponible"
					class='col-form-label ${usuario.errors.get("tiempoDisponible") != null ? "is-invalid" : "" }'>Tiempo:</label>
				<input class="form-control" type="number" id="tiempoDisponible"
					name="tiempoDisponible" required min="0"
					value="${usuario.tiempoDisponible}"></input>
				<div class="invalid-feedback">
					<c:out value='${usuario.errors.get("tiempoDisponible")}'></c:out>
				</div>
			</div>
		</div>


		<div class="mt-4">
			<button type="submit" class="btn btn-primary">Guardar</button>
			<a onclick="window.history.back();" class="btn btn-secondary"
				role="button">Cancelar</a>
		</div>

	</form>

</div>
