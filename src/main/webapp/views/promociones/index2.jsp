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
<link href="assets/css/attractions.css"
	rel="stylesheet" />


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



				<h4>Listado de Promociones</h4>
			</div>


			<div class="p-3">

				<c:if test="${usuario.isAdmin()}">
					<div class="mb-3">
						<a href="attractions/create.do"
							class="btn btn-primary" role="button"> <i
							class="bi bi-plus-lg"></i> Nueva Atracción
						</a>
					</div>
				</c:if>
				<table
					class="table table-stripped table-hover <c:if test="${lado=='LADO OSCURO'}">table-dark</c:if>">
					<thead>
						<tr>

							<th class="p-3">Promoción</th>
							<th class="p-3">Costo</th>
							<th class="p-3">Duraci&oacute;n</th>
							<th class="p-3">Cupo</th>
							<th class="p-3 text-center">Lado</th>
							<th class="p-3 text-center">Info</th>

							<c:if test="${usuario != null}">
								<th class="p-3 text-center">Acciones</th>
							</c:if>


						</tr>
					</thead>
					<tbody>

						<c:forEach items="${promociones}" var="promocion">


							<tr class="align-middle">

								<td class="px-3"><strong><c:out
											value="${promocion.nombre}"></c:out></strong>
									<p>
										<c:out value="${promocion.descripcion}"></c:out>
									</p></td>
								<td class="text-center"><c:out value="${promocion.costo}"></c:out></td>
								<td class="text-center"><c:out
										value="${promocion.tiempoTotal}"></c:out></td>
								<td class="text-center"><c:out
										value="${promocion.getCupo()}"></c:out></td>
								<td><c:out value="${promocion.tipoAtraccion}"></c:out></td>
								<td><a
									href="promocion/detalle?promocionID=${promocion.propuestaID}&lado=${lado}&slider=true"
									class="btn btn-white rounded-0" role="button"><i
										class="far fa-eye"></i></a></td>



								<c:if test="${usuario != null}">
									<td class="p-3"><c:if test="${usuario.admin}">
											<a
												href="attractions/edit.do?id=${promocion.propuestaID}"
												class="btn btn-light rounded-0" role="button"><i
												class="bi bi-pencil-fill"></i></a>
											<a
												href="attractions/delete.do?id=${promocion.propuestaID}"
												class="btn btn-danger rounded" role="button"><i
												class="bi bi-x-circle-fill"></i></a>
										</c:if> <c:choose>

											<c:when
												test="${usuario.puedepagarPropuesta(promocion) && usuario.tieneTiempoDisponible(promocion) && promocion.hayCupoDisponible}">
												<a
													href="/LaFuerza-Turismo/promociones/buy.do?id=${promocion.propuestaID}"
													class="btn btn-success rounded" role="button">Comprar</a>
											</c:when>
											<c:otherwise>
												<a href="#" class="btn btn-secondary rounded disabled"
													role="button">Comprar</a>
											</c:otherwise>
										</c:choose></td>
								</c:if>

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



