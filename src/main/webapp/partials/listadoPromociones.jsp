<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="p-3">
	<c:if test="${usuario.isAdmin()}">
		<div class="mb-3">
			<a href="attractions/create.do" class="btn btn-primary" role="button">
				<i class="bi bi-plus-lg"></i> Nueva Atracción
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
				<c:if test="${!usuario.admin}">
					<th class="p-3 text-center">Info</th>
				</c:if>

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
					<td class="text-center"><c:out value="${promocion.getCupo()}"></c:out></td>
					<td><c:out value="${promocion.tipoAtraccion}"></c:out></td>
					<c:if test="${!usuario.admin}">
						<td><a
							href="promocion/detalle?promocionID=${promocion.propuestaID}&lado=${lado}&slider=true"
							class="btn btn-white rounded-0" role="button"><i
								class="far fa-eye"></i></a></td>
					</c:if>



					<c:if test="${usuario != null}">
						<td class="p-3"><c:if test="${usuario.admin}">
								<a href="attractions/edit.do?id=${promocion.propuestaID}"
									class="btn btn-light rounded-0" role="button"><i
									class="bi bi-pencil-fill"></i></a>
								<a href="attractions/delete.do?id=${promocion.propuestaID}"
									class="btn btn-danger rounded" role="button"><i
									class="bi bi-x-circle-fill"></i></a>
							</c:if> <c:if test="${!usuario.admin}">

								<c:choose>

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
								</c:choose>
							</c:if></td>
					</c:if>

				</tr>


			</c:forEach>



		</tbody>
	</table>
</div>