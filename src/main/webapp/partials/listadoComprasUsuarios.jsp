
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="p-3">

	<table class="table table-stripped table-hover">
		<thead>
			<tr class="text-center">
				<th class="p-3 text-start">Usuario</th>
				<th class="p-3">Propuesta comprada</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${compras}" var="compras">
				<tr class="align-middle text-center">
					<td class="px-3 text-start"><strong><c:out
								value="${compras.getKey().nombre}"></c:out></strong></td>
					<td class="px-3 text-start"><strong><c:out
								value="${compras.getValue().nombre}"></c:out></strong>
</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>