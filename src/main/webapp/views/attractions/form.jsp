<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-body">

	<form class="row g-3">

		<div class="col-3 col-md-2 mb-3">
			<label for="nombre" class="col-form-label">Nombre:</label> <input
				type="text" class="form-control" id="nombre" name="nombre" required
				value="${atraccion.nombre}">
		</div>
		<div class="row g-3">
			<div class="col-3 col-md-2 mb-3">
				<label for="costo"
					class='col-form-label ${atraccion.errors.get("costo") != null ? "is-invalid" : "" }'>Costo:</label>
				<input class="form-control" type="number" id="costo" name="costo"
					required   min="0" value="${atraccion.costo}"></input>
				<div class="invalid-feedback">
					<c:out value='${atraccion.errors.get("costo")}'></c:out>
				</div>
			</div>
			<div class="col-3 col-md-2 mb-3">
				<label for="tiempoTotal"
					class='col-form-label ${atraccion.errors.get("tiempoTotal") != null ? "is-invalid" : "" }'>Duration:</label>
				<input class="form-control" type="number" id="tiempoTotal"
					name="tiempoTotal" min="0" required value="${atraccion.tiempoTotal}"></input>
				<div class="invalid-feedback">
					<c:out value='${atraccion.errors.get("tiempoTotal")}'></c:out>
				</div>
			</div>
			<div class="col-3 col-md-2 mb-3">
				<label for="cupoInicial"
					class='col-form-label ${atraccion.errors.get("cupoInicial") != null ? "is-invalid" : "" }'>Capacity:</label>
				<input class="form-control" type="number" id="cupoInicial"
					name="cupoInicial" required min="0" value="${atraccion.cupoInicial}"></input>
				<div class="invalid-feedback">
					<c:out value='${atraccion.errors.get("cupoInicial")}'></c:out>
				</div>
			</div>
		</div>
	
	
	
		
		<div class="col-md-3 mb-3">
			<label for="tipoAtraccion"
				class='col-form-label ${usuario.errors.get("tipoAtraccion") != null ? "is-invalid" : "" }'>Tipo
				de atracción:</label> 
				<select class="form-select" 
				id="tipoAtraccion" name="tipoAtraccion" required>

				<option
					<c:if test="${atraccion.tipoAtraccion == null }"> selected</c:if>
					value="">Seleccionar...</option>
				<option
					<c:if test="${atraccion.tipoAtraccion == 'LADO_LUMINOSO' }"> selected</c:if>
					value="LADO_LUMINOSO">Lado Luminoso</option>
				<option
					<c:if test="${atraccion.tipoAtraccion == 'LADO_OSCURO' }"> selected</c:if>
					value="LADO_OSCURO">Lado Oscuro</option>
			</select>
			<div class="invalid-feedback">
				<c:out value='${usuario.errors.get("tipoAtraccion")}'></c:out>
			</div>
		</div>
		
		
		
		
		<div class="col-5 mb-3">
			<label for="descripcion"
				class='col-form-label ${atraccion.errors.get("descripcion") != null ? "is-invalid" : "" }'>Descripción:</label>
			<textarea class="form-control" type="text" id="descripcion"
				name="descripcion" required value="${atraccion.descripcion}"
				rows="3"></textarea>
			<div class="invalid-feedback">
				<c:out value='${atraccion.errors.get("descripcion")}'></c:out>
			</div>
		</div>



		<div>

			<button type="submit" class="btn btn-primary">Guardar</button>

			<a onclick="window.history.back();" class="btn btn-secondary"
				role="button">Cancelar</a>
		</div>


	</form>
</div>
