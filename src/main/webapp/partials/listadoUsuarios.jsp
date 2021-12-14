
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="p-3">
	<div class="mb-3">
		<a href="/LaFuerza-Turismo/usuarios/create.do" class="btn btn-primary"
			role="button"> <i class="bi bi-plus-lg"></i> Nuevo Usuario
		</a>
	</div>
	<table class="table table-stripped table-hover">
		<thead>
			<tr class="text-center">
				<th class="p-3 text-start">Usuario</th>
				<th class="p-3">Presupuesto</th>
				<th class="p-3">Tiempo Disponible</th>
				<th class="p-3">Tipo de atraccion</th>
				<th class="p-3">Acciones</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${usuarios}" var="usuario">
				<tr class="align-middle text-center">
					<td class="px-3 text-start"><strong><c:out
								value="${usuario.nombre}"></c:out></strong></td>
					<td>$<c:out value="${usuario.presupuestoDisponible}"></c:out></td>
					<td><c:out value="${usuario.getTiempoDisponibleFormato()}"></c:out></td>
					<td><c:out value="${usuario.tipoAtraccionPreferida.nombre}"></c:out></td>

					<td><a
						href="/LaFuerza-Turismo/usuarios/edit.do?id=${usuario.usuario_id}"
						class="btn btn-light rounded-0" role="button"><i
							class="bi bi-pencil-fill"></i></a> <a
						href="/LaFuerza-Turismo/usuarios/delete.do?id=${usuario.usuario_id}"
						class="btn btn-danger rounded" role="button"><i
							class="bi bi-x-circle-fill"></i></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>