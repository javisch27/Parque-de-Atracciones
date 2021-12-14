<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${usuario.isAdmin()}">
	<div class="mb-3">
		<a href="/LaFuerza-Turismo/attractions/create.do"
			class="btn btn-primary" role="button"> <i class="bi bi-plus-lg"></i>
			Nueva Atracción
		</a>
	</div>
</c:if>
<table class="table table-stripped table-hover">
	<thead>
		<tr>
			<th>Atracci&oacute;n</th>
			<th>Costo</th>
			<th>Duraci&oacute;n</th>
			<th>Cupo</th>
			<th>Tipo</th>
			<th>Acciones</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${atracciones}" var="atraccion">
			<tr>
				<td><strong><c:out value="${atraccion.nombre}"></c:out></strong>
					<p>
						<c:out value="${atraccion.descripcion}"></c:out>
					</p></td>
				<td><c:out value="${atraccion.costo}"></c:out></td>
				<td><c:out value="${atraccion.tiempoTotal}"></c:out></td>
				<td><c:out value="${atraccion.cupoDisponible}"></c:out></td>
				<td><c:out value="${atraccion.tipoAtraccion}"></c:out></td>

				<td><c:if test="${usuario.admin}">
						<a
							href="attractions/edit.do?id=${atraccion.id_atraccion}"
							class="btn btn-light rounded-0" role="button"><i
							class="bi bi-pencil-fill"></i></a>
						<a
							href="/LaFuerza-Turismo/attractions/delete.do?id=${atraccion.id_atraccion}"
							class="btn btn-danger rounded" role="button"><i
							class="bi bi-x-circle-fill"></i></a>
					</c:if> <c:if test="${!usuario.admin}">
						<c:choose>
							<c:when
								test="${usuario.puedepagarPropuesta(atraccion) && usuario.tieneTiempoDisponible(atraccion) && atraccion.hayCupoDisponible}">
								<a
									href="/LaFuerza-Turismo/attractions/buy.do?id=${atraccion.id_atraccion}"
									class="btn btn-success rounded" role="button">Comprar</a>
							</c:when>
							<c:otherwise>
								<a href="#" class="btn btn-secondary rounded disabled"
									role="button">No se puede comprar</a>
							</c:otherwise>
						</c:choose>
					</c:if></td>
			</tr>
		</c:forEach>
	</tbody>
</table>