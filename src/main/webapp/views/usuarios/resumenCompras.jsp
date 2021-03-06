<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

<jsp:include page="/partials/head.jsp"></jsp:include>

<script defer src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<script defer type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script defer src="https://kit.fontawesome.com/d3e9765b95.js"
	crossorigin="anonymous"></script>
<link href="/assets/css/attractions.css" rel="stylesheet" />
<script type="text/javascript" src="/assets/js/listaComprasUsuario.js"
	defer></script>

<script defer type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script defer type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script defer type="text/javascript"
	src="https://cdn.datatables.net/v/bs5/jszip-2.5.0/dt-1.11.3/b-2.0.1/b-colvis-2.0.1/b-html5-2.0.1/b-print-2.0.1/datatables.min.js"></script>
<script defer type="text/javascript"
	src="https://cdn.datatables.net/plug-ins/1.11.3/api/sum().js"></script>


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


			<div
				class="d-flex justify-content-between align-items-center px-4 p-3 m-3 mt-4 rounded <c:choose>
					<c:when test="${lado=='LADO OSCURO'}">bg-dark</c:when>
					<c:otherwise>bg-light</c:otherwise>
				</c:choose>">


				<h4>Mis Compras</h4>
				<div class="d-flex flex-column align-items-end">
					<h6 class="mx-4">
						Gasto total: $
						<c:out value="${usuario.getPresupuestoUtilizado()}"></c:out>
					</h6>
					<h6 class="mx-4">
						Tiempo total:
						<c:out value="${usuario.getTiempoUtilizado()}"></c:out>
					</h6>
				</div>

			</div>


			<jsp:include page="/partials/listadoResumenCompras.jsp"></jsp:include>

		</main>


	</div>

	<footer>
		<jsp:include page="/partials/footer.jsp"></jsp:include>
	</footer>

	<jsp:include page="/partials/mensajes.jsp"></jsp:include>

</body>
</html>



