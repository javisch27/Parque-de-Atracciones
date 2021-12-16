<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="/assets/js/formPromocion.js" defer></script>

<!-- formulario PROMOCION -->

<div class="modal-body">

	<div class="modal-body">
		<form id="formulario">

			<div class="row g-3">

				<div class="col-md-3 mb-3">
					<label for="tipoAtraccion"
						class='col-form-label ${promocion.errors.get("tipoAtraccion") != null ? "is-invalid" : "" }'>Lado:</label>
					<select class="form-select" id="tipoAtraccion" name="tipoAtraccion"
						required>

						<option
							<c:if test="${promocion.tipoAtraccion == null }"> selected</c:if>
							value="">Seleccionar...</option>
						<option
							<c:if test="${promocion.tipoAtraccion == 'LADO_LUMINOSO' }"> selected</c:if>
							value="LADO_LUMINOSO">Lado Luminoso</option>
						<option
							<c:if test="${promocion.tipoAtraccion == 'LADO_OSCURO' }"> selected</c:if>
							value="LADO_OSCURO">Lado Oscuro</option>
					</select>
					<div class="invalid-feedback">
						<c:out value='${promocion.errors.get("tipoAtraccion")}'></c:out>
					</div>
				</div>

				<div class="col-md-4 mb-3">
					<label
						class='col-form-label ${promocion.errors.get("tipoPromocion") != null ? "is-invalid" : "" }'
						for="tipoPromocion">Tipo de promoción:</label> <select
						class="form-select" id="tipoPromocion" name="tipoPromocion"
						required>

						<option
							<c:if test="${promocion.tipoAtraccion == null }"> selected</c:if>
							value="">Seleccionar...</option>
						<option
							<c:if test="${promocion.tipoAtraccion == 'LADO_LUMINOSO' }"> selected</c:if>
							value="PORCENTUAL">Promoción Porcentual</option>
						<option
							<c:if test="${promocion.tipoAtraccion == 'LADO_OSCURO' }"> selected</c:if>
							value="ABSOLUTA">Promoción Absoluta</option>
						<option
							<c:if test="${promocion.tipoAtraccion == 'LADO_OSCURO' }"> selected</c:if>
							value="AXB">Promoción AXB</option>
					</select>
				</div>


				<div class="col-4 mb-3 d-none" id="promosConVariables">
					<label for="variable" class="col-form-label"> <span
						id="inputVariable"></span></label> <input type="text" class="form-control"
						id="variable" name="variable" required
						value="${promocion.variable}">
				</div>
			</div>



			<div class="col-4 mb-3">
				<label for="nombre" class="col-form-label">Nombre:</label> <input
					type="text" class="form-control" id="nombre" name="nombre" required
					value="${promocion.nombre}">
			</div>


			<div class="col-5 mb-3">
				<label for="descripcion"
					class='col-form-label ${promocion.errors.get("descripcion") != null ? "is-invalid" : "" }'>Descripción:</label>
				<textarea class="form-control" type="text" id="descripcion"
					name="descripcion" required rows="3"
					value="${promocion.descripcion}"></textarea>
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

			<div class="mb-3 atraccionesGratis d-none" id="atraccionesGratis">
				<label for="atraccionesGratisPromoAXB">Atracciones gratis en
					promociones AXB:</label> <input class="form-control" type="text"
					id="atraccionesGratisPromoAXB" name="atraccionesGratisPromoAXB"></input>
			</div>



			<div class="mb-3 d-none" id="chechLuminoso" >
				<c:forEach items="${atracciones}" var="atraccion">
					<c:if test="${atraccion.tipoAtraccion == 'LADO_LUMINOSO'}">
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								id="${atraccion.nombre}" name="listadoAtraccionesSelec">
							<label class="form-check-label" for="${atraccion.nombre}">
								<c:out value="${atraccion.nombre}"></c:out>
							</label>
						</div>
					</c:if>
				</c:forEach>
			</div>
			
			<div class="mb-3 d-none" id="chechOscuro" >
				<c:forEach items="${atracciones}" var="atraccion">
					<c:if test="${atraccion.tipoAtraccion == 'LADO_OSCURO'}">
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								id="${atraccion.nombre}" name="listadoAtraccionesSelec">
							<label class="form-check-label" for="${atraccion.nombre}">
								<c:out value="${atraccion.nombre}"></c:out>
							</label>
						</div>
					</c:if>
				</c:forEach>
			</div>




			<div>
				<button type="submit" class="btn btn-primary">Guardar</button>
				<a onclick="window.history.back();" class="btn btn-secondary"
					role="button">Cancelar</a>
			</div>

		</form>

	</div>


</div>
