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
						class='col-form-label ${promocion.errors.get("tipo_promocion_id") != null ? "is-invalid" : "" }'
						for="tipoPromocion">Tipo de promoción:</label> <select
						class="form-select" id="tipoPromocion" name="tipoPromocion"
						required>

						<option
							<c:if test="${promocion.tipo_promocion_id == null }"> selected</c:if>
							value="">Seleccionar...</option>
						<option
							<c:if test="${promocion.tipo_promocion_id == 1 }"> selected</c:if>
							value="PORCENTUAL">Promoción Porcentual</option>
						<option
							<c:if test="${promocion.tipo_promocion_id == 2 }"> selected</c:if>
							value="ABSOLUTA">Promoción Absoluta</option>
						<option
							<c:if test="${promocion.tipo_promocion_id == 3 }"> selected</c:if>
							value="AXB">Promoción AXB</option>
					</select>
				</div>


				<div class="col-4 mb-3 d-none" id="promosConVariables">
					<label for="variable" class="col-form-label"> <span
						id="variable"></span></label> <input type="text" class="form-control"
						id="variable" name="variable"
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
					name="descripcion" required rows="3">${promocion.descripcion}</textarea>
				<div class="invalid-feedback">
					<c:out value='${promocion.errors.get("descripcion")}'></c:out>
				</div>
			</div>


			<div class="d-none">

				<div class="mb-3">
					<label for="atraccionesIncluidas">Atracciones :</label> <input
						class="form-control" type="text" id="atraccionesIncluidas"
						name="atraccionesIncluidas"></input>
				</div>

				<div class="mb-3">
					<label for="atraccionesGratisPromoAXB">Atracciones gratis
						en promociones AXB:</label> <input class="form-control" type="text"
						id="atraccionesGratisPromoAXB" name="atraccionesGratisPromoAXB"></input>
				</div>



			</div>


			<div class="row">
				<div id='listaCheck' class="col-4">
					<div class="mb-3 mb-4" id="chechLuminoso">
<%-- 						<c:if test="${promocion.tipoAtraccion  == 'LADO_LUMINOSO'}"> --%>
							<label for="listadoAtraccionesSelec" class="my-3">Listado
								Atracciones</label>
							<c:forEach items="${atracciones}" var="atraccion">
								<c:if test="${atraccion.tipoAtraccion == 'LADO_LUMINOSO'}">
									<div class="form-check">
										<input class="form-check-input check" type="checkbox"
											"
										name="${atraccion.id_atraccion}"
											<c:forEach items="${promocion.atraccionesIncluidas}" var="atraccionDePromo">
												<c:if test="${atraccionDePromo.id_atraccion == atraccion.id_atraccion}">																
										checked="true"
											</c:if>
										</c:forEach>>
										<label class="form-check-label" for="${atraccion.nombre}">
											<c:out value="${atraccion.nombre}"></c:out>
										</label>
									</div>
								</c:if>
							</c:forEach>
					<%-- 	</c:if> --%>
					</div>
					

					<div class="mb-3 " id="chechOscuro">
				<%-- 		<c:if test="${promocion.tipoAtraccion == 'LADO_OSCURO'}"> --%>
							<label for="listadoAtraccionesSelec" class="mt-3">Listado
								Atracciones</label>
							<c:forEach items="${atracciones}" var="atraccion">
								<c:if test="${atraccion.tipoAtraccion == 'LADO_OSCURO'}">
									<div class="form-check">
										<input class="form-check-input check" type="checkbox"
											"
										name="${atraccion.id_atraccion}"
											<c:forEach items="${promocion.atraccionesIncluidas}" var="atraccionDePromo">
												<c:if test="${atraccionDePromo.id_atraccion == atraccion.id_atraccion}">																
										checked="true"
											</c:if>
										</c:forEach>>


										<label class="form-check-label"
											for="${atraccion.id_atraccion}"> <c:out
												value="${atraccion.nombre}"></c:out>
										</label>
									</div>
								</c:if>
							</c:forEach>
					<%-- 	</c:if> --%>
					</div>
				</div>




				<div id='listaCheckAXB' class="col-4">
		
					<div class="mb-3 mb-4" id="chechLuminosoAXB">
<%-- 						<c:if test="${promocion.tipoAtraccion  == 'LADO_LUMINOSO'}"> --%>
							<label for="listadoAtraccionesSelec" class="my-3">Listado
								Atracciones Gratis</label>
							<c:forEach items="${atracciones}" var="atraccion">
								<c:if test="${atraccion.tipoAtraccion == 'LADO_LUMINOSO'}">
									<div class="form-check">
										<input class="form-check-input checkAXB" type="checkbox"					
										name="${atraccion.id_atraccion}"
									<c:choose><c:when test="${promocion.tipo_promocion_id == 3}">
											<c:forEach items="${promocion.atraccionesGratis}" var="atraccionesGratisPromoAXB">
												<c:if test="${atraccionDePromo.id_atraccion == atraccion.id_atraccion}">																
										checked="true"
											</c:if>
										</c:forEach></c:when><c:otherwise> </c:otherwise></c:choose>>
										<label class="form-check-label" for="${atraccion.nombre}">
											<c:out value="${atraccion.nombre}"></c:out>
										</label>
									</div>
								</c:if>
							</c:forEach>
					<%-- 	</c:if> --%>
					</div>
					

					<div class="mb-3 " id="chechOscuroAXB">
				<%-- 		<c:if test="${promocion.tipoAtraccion == 'LADO_OSCURO'}"> --%>
							<label for="listadoAtraccionesSelec" class="mt-3">Listado
								Atracciones Gratis</label>
							<c:forEach items="${atracciones}" var="atraccion">
								<c:if test="${atraccion.tipoAtraccion == 'LADO_OSCURO'}">
									<div class="form-check">
										<input class="form-check-input checkAXB" type="checkbox"
											"
										name="${atraccion.id_atraccion}"
										
										<c:choose><c:when test="${promocion.tipo_promocion_id == 3}">
											<c:forEach items="${promocion.atraccionesGratis}" var="atraccionesGratisPromoAXB">
												<c:if test="${atraccionDePromo.id_atraccion == atraccion.id_atraccion}">																
										checked="true"
											</c:if>
										</c:forEach></c:when></c:choose>>

										<label class="form-check-label"
											for="${atraccion.id_atraccion}"> <c:out
												value="${atraccion.nombre}"></c:out>
										</label>
									</div>
								</c:if>
							</c:forEach>
					<%-- 	</c:if> --%>
					</div>
					
							
					
				</div>
			</div>

			<div>
				<button type="submit" class="btn btn-primary">Guardar</button>
				<a onclick="window.history.back();" class="btn btn-secondary"
					role="button">Cancelar</a>
			</div>

		</form>

	</div>


</div>
