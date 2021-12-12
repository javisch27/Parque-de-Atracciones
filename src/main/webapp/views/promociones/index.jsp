<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/partials/nav.jsp"></jsp:include>

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

		<div class="bg-light p-4 mb-3 rounded">
			<h1>Estas son las promociones de la Fuerza</h1>
		</div>

		<c:if test="${usuario.isAdmin()}">
			<div class="mb-3">
				<a href="promociones/create.do"
					class="btn btn-primary" role="button"> <i class="bi bi-plus-lg"></i>
					Nueva Promoción
				</a>
			</div>
		</c:if>
		<table class="table table-stripped table-hover">
			<thead>
				<tr>
					<th>Promoci&oacute;n</th>
					<th>Costo</th>
					<th>Duraci&oacute;n</th>
					<th>Cupo</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${promociones}" var="promocion">
					<tr>
						<td><strong><c:out value="${promocion.nombre}"></c:out></strong>
							<p><c:out value="${promocion.descripcion}"></c:out></p></td>
						<td><c:out value="${promocion.costo}"></c:out></td>
						<td><c:out value="${promocion.tiempoTotal}"></c:out></td>
						<td><c:out value="${promocion.hayCupoDisponible}"></c:out></td>
						<td><c:if test="${usuario.admin}">
								 <a   href="promociones/edit.do?id=${promocion.propuestaID}"
									class="btn btn-light rounded-0" role="button"><i
									class="bi bi-pencil-fill"></i></a>
								<a href="promociones/delete.do?id=${promocion.propuestaID}"
									 class="btn btn-danger rounded" role="button"><i
									class="bi bi-x-circle-fill"></i></a>
							</c:if> <c:choose>

								<c:when
									test="${usuario.puedepagarPropuesta(promocion) && usuario.tieneTiempoDisponible(promocion) && promocion.hayCupoDisponible}">
									<a href="promociones/buy.do?id=${promocion.propuestaID}"
										class="btn btn-success rounded" role="button">Comprar</a>
								</c:when>
								<c:otherwise>
									<a href="#" class="btn btn-secondary rounded disabled"
										role="button">No se puede comprar</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</main>

</body>
</html>