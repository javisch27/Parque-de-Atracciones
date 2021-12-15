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


	<%
	String promocionID = request.getParameter("promocionID");
	%>
	<%
	if (promocionID == null) {
		promocionID = "0";
	}
	%>
	<%
	pageContext.setAttribute("promocionID", promocionID);
	%>



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
			class="h-100 d-flex justify-content-center align-items-center px-5 py-3">
			<div class="col-md-7 my-4  me-auto">
				<img
					src="/assets/img/attractions/details/<c:out value="${atraccion.id_atraccion}"></c:out>.jpeg"
					alt="..." class="img-fluid">
			</div>

			<div class="col-md-4 me-auto fondoTransparente rounded p-4">
				<div class="d-flex flex-row mb-3">
					<div class="col-md-3">
						<img class="col-8"
							<c:choose><c:when test="${lado=='LADO OSCURO'}"> src="/assets/img/home/dark-grey.png"</c:when>
		<c:otherwise>src="/assets/img/home/light.png"</c:otherwise></c:choose>>
					</div>

					<div class="col-md-9 align-self-center me-auto">
						<h3>
							<c:out value="${atraccion.nombre}"></c:out>
						</h3>

					</div>

				</div>
				<div>
					<p class="text-star">${atraccion.descripcion}</p>
				</div>
				<div
					class="d-flex flex-row mb-3 justify-content-around align-items-center mt-5">
					<div
						class="col-md-3 fondoTransparente<c:choose><c:when test="${lado=='LADO OSCURO'}">Dark</c:when></c:choose>  rounded iconos text-center py-3">${atraccion.costo}</div>
					<div
						class="col-md-3 fondoTransparente<c:choose><c:when test="${lado=='LADO OSCURO'}">Dark</c:when></c:choose>  rounded iconos text-center py-3">${atraccion.tiempoTotal}</div>
				</div>

				<div
					class="d-flex flex-fill align-items-end justify-content-end mt-5 ">
					<c:if test="${usuario != null}">
						<c:choose>
							<c:when
								test="${usuario.puedepagarPropuesta(atraccion) && usuario.tieneTiempoDisponible(atraccion) && atraccion.hayCupoDisponible && usuario.atraccionNoContratada(atraccion)}">

								<div>
									<a
										href="/attractions/buy.do?id=${atraccion.id_atraccion}&promocionID=${promocionID}&lado=${lado}&ruta=attraction"
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

		<div class="mx-5 pb-4">

			<c:choose>
				<c:when test="${usuario == null}">

					<form>
						<button class="btn btn-primary rounded" type="button" name="lado"
							value="${lado}" onclick="history.back()">Volver</button>
					</form>


				</c:when>
				<c:otherwise>


					<c:choose>
						<c:when test="${promocionID == 0}">

							<form>
								<button class="btn btn-primary rounded" type="button"
									name="lado" value="${lado}" onclick="history.back()">Volver</button>
							</form>


						</c:when>


						<c:otherwise>
							<a
								href="/promocion/detalle?promocionID=${promocionID}&lado=${lado} "
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

	<jsp:include page="/partials/mensajes.jsp"></jsp:include>



</body>
</html>