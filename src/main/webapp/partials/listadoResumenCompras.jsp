<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="p-3">

	<table id="tablaCompras"
		class="table table-stripped table-hover <c:if test="${lado=='LADO OSCURO'}">table-dark</c:if>">
		<thead>
			<tr class="text-center">

				<th class="p-3 text-start">Nombre</th>
				<th class="p-3">Tipo</th>
				<th class="p-3">Costo</th>
				<th class="p-3">Duración</th>
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
					<td>$<c:out value="${propuesta.costo}"></c:out></td>
					<td><c:out value="${propuesta.getTiempoTotalFormato()}"></c:out></td>
					<td><c:out value="${propuesta.tipoAtraccion.nombre}"></c:out></td>
					<td><a href="/attraction?attractionID=${propuesta.propuestaID}"
						class="btn btn-white rounded-0" role="button"><i
							class="far fa-eye"></i></a></td>
				</tr>

			</c:forEach>

		</tbody>
	</table>
	
		<a onclick="history.go(-2);" class="btn btn-primary"
		role="button">Volver</a>
</div>