<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

<jsp:include page="/partials/head.jsp"></jsp:include>


<script defer src="https://kit.fontawesome.com/d3e9765b95.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="assets/css/listadoPropuestas.css" rel="stylesheet" />


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

		<main class="container">

			<c:if test="${flash != null}">
				<div class="alert alert-danger">
					<p>
						<c:out value="${flash}" />
						<c:if test="${errors != null}">
							<ul>
								<c:forEach items="${errors}" var="entry">
									<li><c:out value="${entry.getValue()}"></c:out></li>
								</c:forEach>
							</ul>
						</c:if>
					</p>
				</div>
			</c:if>

			<div
				class="px-4 p-3 m-3 mt-4 rounded <c:choose>
					<c:when test="${lado=='LADO OSCURO'}">bg-dark</c:when>
					<c:otherwise>bg-light</c:otherwise>
				</c:choose>">


				<h4>Listado de Atracciones</h4>
			</div>

			<jsp:include page="/partials/listadoAtracciones.jsp"></jsp:include>

		</main>






	</div>

	<footer>
		<jsp:include page="/partials/footer.jsp"></jsp:include>
	</footer>


</body>
</html>



