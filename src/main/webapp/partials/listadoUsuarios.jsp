
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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