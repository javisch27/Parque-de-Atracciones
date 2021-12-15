 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="p-3">
	<c:if test="${usuario.isAdmin()}">
		<div class="mb-3">
			<a href="/promociones/create.do" class="btn btn-primary" role="button">
				<i class="bi bi-plus-lg"></i> Nueva Promoción
			</a>
		</div>
	</c:if>
	<table
		class="table table-stripped table-hover <c:if test="${lado=='LADO OSCURO'}">table-dark</c:if>">
		<thead>
			<tr class="text-center">

				<th class="p-3 text-start">Promoción</th>
				<th class="p-3">Costo</th>
				<th class="p-3">Duración</th>
				<th class="p-3">Cupo</th>
				<th class="p-3">Lado</th>
				<c:if test="${!usuario.admin}">
					<th class="p-3">Info</th>
				</c:if>

				<c:if test="${usuario != null}">
					<th class="p-3">Acciones</th>
				</c:if>


			</tr>
		</thead>
		<tbody>

			<c:forEach items="${promociones}" var="promocion">


				<tr class="align-middle text-center">

					<td class="px-3 text-start"><strong><c:out
								value="${promocion.nombre}"></c:out></strong>
						<p>
							<c:out value="${promocion.descripcion}"></c:out>
						</p></td>
					<td >$<c:out value="${promocion.costo}"></c:out></td>
					<td ><c:out
							value="${promocion.getTiempoTotalFormato()}"></c:out></td>
					<td ><c:out value="${promocion.getCupoPromo()}"></c:out></td>
					<td ><c:out value="${promocion.tipoAtraccion.nombre}"></c:out></td>
					<c:if test="${!usuario.admin}">
						<td><a
							href="/promocion/detalle?promocionID=${promocion.propuestaID}&lado=${lado}&slider=true"
							class="btn btn-white rounded-0" role="button"><i
								class="far fa-eye"></i></a></td>
					</c:if>



					<c:if test="${usuario != null}">
						<td class="p-3 text-center"><c:if test="${usuario.admin}">
								<a href="/promociones/edit.do?id=${promocion.propuestaID}"
									class="btn btn-light rounded-0" role="button"><i
									class="bi bi-pencil-fill"></i></a>
								<a href="/promociones/delete.do?id=${promocion.propuestaID}"
									class="btn btn-danger rounded" role="button"><i
									class="bi bi-x-circle-fill"></i></a>
							</c:if> <c:if test="${!usuario.admin}">

								<c:choose>

									<c:when
										test="${usuario.puedepagarPropuesta(promocion) && usuario.tieneTiempoDisponible(promocion) && promocion.hayCupoDisponible}">
										<a
											href="/promociones/buy.do?id=${promocion.propuestaID}"
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
