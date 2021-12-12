<!-- Carousel -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="demo" class="carousel slide" data-bs-ride="carousel">

	<!-- Indicators/dots -->
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
			class="active"></button>
		<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
		<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
	</div>

	<!-- The slideshow/carousel -->
	<div class=" carousel-inner ">


		<c:forEach items="${promociones}" var="promocion" begin="1" end="3"
			varStatus="loop">

			<div
				class="carousel-item  <c:if test = "${loop.count == 1}"> active</c:if>">
				<img
					src="assets/img/promotions/slider/<c:out value="${promocion.propuestaID}"></c:out>.jpeg"
					alt="${promocion.propuestaID}" class="d-block w-100">

				<div class="carousel-caption  d-md-block  text-dark mb-5">
					<div class=" d-flex justify-content-center">
						<div class=" col-6 ">

							<div class="fondoTransparenteDark roundedpy-4 px-3 py-4 mb-3">
								<h5>${promocion.nombre}</h5>
								<p>${promocion.descrpicion}</p>
								<div class=" d-flex justify-content-center">
									<div class="fondoTransparenteDark rounded py-2 px-4 mx-2">$${promocion.costo}</div>
									<div class="fondoTransparenteDark rounded py-2 px-4 mx-2">${promocion.tiempoTotal}</div>
								</div>

							</div>

							<div class="d-flex justify-content-between">
								<c:choose>
									<c:when
										test="${usuario.puedepagarPropuesta(promocion) && usuario.tieneTiempoDisponible(promocion) && promocion.hayCupoDisponible}">

										<div>
											<a href="promociones/buy.do?id=${promocion.propuestaID}"
												class="btn btn-success rounded" role="button">Comprar</a>

										</div>
									</c:when>
									<c:otherwise>
										<div>
											<a href="#" class="btn btn-secondary rounded disabled"
												role="button">Comprar</a>
										</div>
									</c:otherwise>
								</c:choose>
								<div>
									<a
										href="promocion/detalle?promocionID=${promocion.propuestaID}&lado=${lado} "
										class="btn btn-success rounded" role="button">Info</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</c:forEach>




	</div>

	<!-- Left and right controls/icons -->
	<button class="carousel-control-prev" type="button"
		data-bs-target="#demo" data-bs-slide="prev">
		<span class="carousel-control-prev-icon"></span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#demo" data-bs-slide="next">
		<span class="carousel-control-next-icon"></span>
	</button>
</div>