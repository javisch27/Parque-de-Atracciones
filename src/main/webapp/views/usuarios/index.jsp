
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
			<h1>Estas son las usuarios de la Fuerza</h1>
		</div>
			<div class="mb-3">
				<a href="/LaFuerza-Turismo/usuarios/create.do" class="btn btn-primary"
					role="button"> <i class="bi bi-plus-lg"></i> Nuevo Usuario
				</a>
			</div>
		<table class="table table-stripped table-hover">
			<thead>
				<tr>
					<th>Usuario</th>
					<th>Presupuesto</th>
					<th>Tiempo</th>
					<th>Tipo de atraccion</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${usuarios}" var="usuario">
					<tr>
						<td><strong><c:out value="${usuario.nombre}"></c:out></strong></td>
						<td><c:out value="${usuario.presupuestoDisponible}"></c:out></td>
						<td><c:out value="${usuario.tiempoDisponible}"></c:out></td>
						<td><c:out value="${usuario.tipoAtraccionPreferida}"></c:out></td>

						<td><a href="/LaFuerza-Turismo/usuarios/edit.do?id=${usuario.usuario_id}"
									class="btn btn-light rounded-0" role="button"><i
									class="bi bi-pencil-fill"></i></a>
								<a href="/LaFuerza-Turismo/usuarios/delete.do?id=${usuario.usuario_id}"
									class="btn btn-danger rounded" role="button"><i
									class="bi bi-x-circle-fill"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</main>

</body>
</html>