<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>

<link href="assets/css/userIndex.css" rel="stylesheet" />


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
		<header
			class="<c:choose><c:when test="${lado=='LADO OSCURO'}"> oscuro</c:when><c:otherwise>luminoso </c:otherwise></c:choose>"
			id="header"> </header>


		<div
			class="container my-5 py-4 px-5 rounded d-flex flex-column align-items-center justify-content-center"
			id="fondo-cards">

			<div class="p-3 col-11">

				<jsp:include page="/partials/carousel.jsp"></jsp:include>
			</div>


	
		</div>

	</div>


	<footer>
		<jsp:include page="/partials/footer.jsp"></jsp:include>
	</footer>



</body>
</html>