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
<link href="assets/css/attractions.css" rel="stylesheet" />
<script type="text/javascript"
	src="/LaFuerza-Turismo/assets/js/listaComprasUsuario.js" defer></script>
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



				<h4>Mis Compras</h4>
			</div>


			<div class="p-3">


				<table id="tablaCompras"
					class="table table-stripped table-hover <c:if test="${lado=='LADO OSCURO'}">table-dark</c:if>">
					<thead>
						<tr class="text-center">

							<th class="p-3 text-start">Nombre</th>
							<th class="p-3">Tipo</th>
							<th class="p-3">Duraci&oacute;n</th>
							<th class="p-3">Costo</th>
							<th class="p-3">Lado</th>
							<th class="p-3">Info</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach items="${propuestas}" var="propuesta">


							<tr class="align-middle text-center">

								<td class="px-3 text-start"><strong><c:out
											value="${propuesta.nombre}"></c:out></strong>
									<p>
										<c:out value="${propuesta.descripcion}"></c:out>
									</p></td>
								<td><c:out value="${propuesta.tipoPropuesta()}"></c:out></td>
								<td><c:out value="${propuesta.costo}"></c:out></td>
								<td><c:out value="${propuesta.tiempoTotal}"></c:out></td>
								<td><c:out value="${propuesta.tipoAtraccion.nombre}"></c:out></td>
								<td><a
									href="attraction?attractionID=${propuesta.propuestaID}"
									class="btn btn-white rounded-0" role="button"><i
										class="far fa-eye"></i></a></td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
			</div>

		</main>






	</div>

	<footer>
		<jsp:include page="/partials/footer.jsp"></jsp:include>
	</footer>


</body>
</html>



