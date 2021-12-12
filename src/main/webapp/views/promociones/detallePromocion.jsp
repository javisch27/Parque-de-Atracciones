<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>


<link href="LaFuerza-Turismo/assets/css/guestAttraction.css"
	rel="stylesheet" />


</head>

<body>


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


			<div class="row pb-4">
				<c:forEach items="${atracciones}" var="atraccion" begin="0" end="2">
					<div class="col-sm-4">
						<div
							class="card my-3 <c:choose><c:when test="${lado=='LADO OSCURO'}"> border-dark</c:when></c:choose> ">
							<img class="card-img-top"
								src="../assets/img/attractions/cards/<c:out value="${atraccion.id_atraccion}"></c:out>.jpeg"
								alt="Card image cap">
							<div
								class="card-body  <c:choose><c:when test="${lado=='LADO OSCURO'}"> text-white-50 bg-dark</c:when></c:choose>">
								<h5 class="card-title">
									<c:out value="${atraccion.nombre}"></c:out>
								</h5>
								<p class="card-text">"${atraccion.descripcion}"</p>

					<%-- 			<form method="get" action="../attraction">
									<button type="submit" class="btn btn-secondary"
										value="${atraccion.id_atraccion}" name="attractionID">Info</button>
								</form> --%>
								
									<div>
									<a
										href="../attraction?promocionID=${promocion.propuestaID}&lado=${lado}&attractionID=${atraccion.id_atraccion} "
										class="btn btn-secondary rounded" role="button">Info</a>
								</div>


							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		
		
		
		
		
		</div>


	<footer>
		<jsp:include page="/partials/footer.jsp"></jsp:include>
	</footer>




</body>
</html>
