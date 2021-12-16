
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>


<link href="/assets/css/guestAttraction.css" rel="stylesheet" />


</head>

<body>

	<jsp:include page="/partials/login-modal.jsp"></jsp:include>
	<jsp:include page="/partials/user-modal.jsp"></jsp:include>
	<jsp:include page="/partials/navbar.jsp"></jsp:include>

	<c:choose>
		<c:when test="${lado=='LADO OSCURO'}">
			<jsp:include page="/partials/sidebarDark.jsp"></jsp:include></c:when>
		<c:otherwise><jsp:include
				page="/partials/sidebarLight.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>


	<div id="main"
		class="px-0  <c:choose><c:when test="${lado=='LADO OSCURO'}">themeOscuro</c:when></c:choose>">


		<div
			class="d-flex flex-column justify-content-center align-items-start px-5 py-4">

			<div class="col-md-8  m-3 fondoTransparenteLight rounded py-4">
				<div class="d-flex flex-row mb-3 mt-3">
					<div class="col-md-3 text-end">
						<img class="col-4"
							<c:choose><c:when test="${lado=='LADO OSCURO'}"> src="/assets/img/home/dark-grey.png"</c:when><c:otherwise>src="/assets/img/home/light.png"</c:otherwise></c:choose>>

					</div>
					<div class="col-md-9 align-self-center mx-3">
						<h3>
							<c:out value="${promocion.nombre}"></c:out>
						</h3>

					</div>

				</div>
				<div>
					<p class="text-center p-3">${promocion.descripcion}</p>
				</div>
				<div
					class="d-flex flex-row mb-3 justify-content-around align-items-center mt-5">
					<div class="row">

						<div
							class="col-md-3  mx-2 fondoTransparente<c:choose><c:when test="${lado=='LADO OSCURO'}">Dark</c:when></c:choose>  rounded iconos text-center py-3">${promocion.costo}</div>
						<div
							class="col-md-3 mx-2  fondoTransparente<c:choose><c:when test="${lado=='LADO OSCURO'}">Dark</c:when></c:choose>  rounded iconos text-center py-3">${promocion.tiempoTotal}</div>
					</div>
					<div>
						<c:if test="${usuario != null}">
							<c:choose>
								<c:when
									test="${usuario.puedeAdquirirPropuesta(promocion) && promocion.hayCupoDisponible}">

									<div>
										<a href="/promociones/buy.do?id=${promocion.propuestaID}"
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
						</c:if>

					</div>
				</div>
			</div>


			<div class="my-4 ">
				<h4 class="mb-4"">Atracciones Incluídas</h4>
				<div class="row row-cols-1 row-cols-md-3 g-4 ">

					<c:forEach items="${atracciones}" var="atraccion">
						<!-- 						<div class="col-sm-4"> -->
						<div class="col">
							<div
								class="card h-100 <c:choose><c:when test="${lado=='LADO OSCURO'}"> border-dark</c:when></c:choose> ">
								<img class="card-img-top"
									src="/assets/img/attractions/cards/<c:out value="${atraccion.id_atraccion}"></c:out>.jpeg"
									alt="Card image cap">
								<div
									class="card-body d-flex flex-column <c:choose><c:when test="${lado=='LADO OSCURO'}"> text-white-50 bg-dark</c:when></c:choose>">
									<h5 class="card-title">
										<c:out value="${atraccion.nombre}"></c:out>
									</h5>
									<p class="card-text">"${atraccion.descripcion}"</p>


									<div
										class="d-flex flex-fill align-items-end justify-content-end">

										<a
											href="/attraction?id=${promocion.propuestaID}&lado=${lado}&attractionID=${atraccion.id_atraccion} "
											class="btn btn-primary rounded" role="button">Info</a>

									</div>


								</div>
							</div>
						</div>

					</c:forEach>

				</div>

			</div>
		</div>

		<div class="mx-5 pb-4">

			<c:choose>
				<c:when test="${usuario == null}">

					<a href="/promociones?lado=${lado} "
						class="btn btn-primary rounded" role="button">Volver</a>


				</c:when>
				<c:otherwise>
					<%
					String slider = request.getParameter("slider");
					%>
					<%
					pageContext.setAttribute("slider", slider);
					%>

					<c:choose>
						<c:when test="${slider == 'true'}">
							<a href="/promociones?lado=${lado} "
								class="btn btn-primary rounded" role="button">Volver</a>
						</c:when>
						<c:otherwise>
							<a
								href="/index2.jsp?lado=${lado} "
								class="btn btn-primary rounded" role="button">Volver</a>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>


		</div>



	</div>


	<footer>
		<jsp:include page="/partials/footer.jsp"></jsp:include>
	</footer>




</body>
</html>
