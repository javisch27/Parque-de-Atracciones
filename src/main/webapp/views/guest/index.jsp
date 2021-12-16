<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>
<link href="/assets/css/guest.css" rel="stylesheet" />

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
		<header
			class="<c:choose><c:when test="${lado=='LADO OSCURO'}"> oscuro</c:when><c:otherwise>luminoso </c:otherwise></c:choose>"
			id="header"> </header>



		<div class="container mt-5 py-4 px-5  rounded" id="fondo-cards">
			<div class="row m-4">
				<div class="col-2">
					<img class="icono"
						<c:choose><c:when test="${lado=='LADO OSCURO'}"> src="/assets/img/home/dark.png"</c:when>
		<c:otherwise>src="/assets/img/home/light.png"</c:otherwise></c:choose>>
				</div>
				<div class="col-8">
					<p class="text-center"
						<c:choose><c:when test="${lado=='LADO OSCURO'}">text-white</c:when></c:choose>>Algun
						texto explicando de que se trata el parque, que puede hacer atc
						teAlgun texto explicando de que se trata el parque, que puede
						hacer atc teAlgun texto explicando de que se trata el parque, que
						puede hacer atc asdfasdfa adsf asdf asdf d dsfasdfasd dasdf asd
						asdfsdfsdfadddasddd asd asdf t</p>
				</div>
			</div>



			<div class="row row-cols-1 row-cols-md-3 g-4 pb-4">
				<c:forEach items="${atracciones}" var="atraccion" begin="0" end="2">
					<div class="col-sm-4">
						<div
							class="card  h-100 my-3 <c:choose><c:when test="${lado=='LADO OSCURO'}"> border-dark</c:when></c:choose> ">
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

									<form method="get" action="attraction">
										<button type="submit" class="btn btn-primary"
											value="${atraccion.id_atraccion}" name="attractionID">Info</button>
									</form>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>



		<div class="d-flex justify-content-center bd-highlight " >
			<div class="py-4">
				<form method="GET" action="guest">
					<button type="submit" id="boton-lado"
						
						<c:choose><c:when test="${lado=='LADO OSCURO'}"> class="btn fondoTransparente rounded btn-lg m-4 cambiarLado btnLuminoso" value= "Lado Luminoso"</c:when>
		<c:otherwise>class="btn fondoTransparente rounded btn-lg m-4 cambiarLado btnOscuro" value= "Lado Oscuro"</c:otherwise></c:choose>
						name="lado">CAMBIAR DE LADO</button>

				</form>
			</div>
		</div>

	</div>




	<footer>
		<jsp:include page="/partials/footer.jsp"></jsp:include>
	</footer>



</body>
</html>
