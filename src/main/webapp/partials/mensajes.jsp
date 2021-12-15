
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:if test="${flash != null}">
	<c:choose>
		<c:when test="${errors != null}">
			<jsp:include page="/partials/toastWarning.jsp"></jsp:include></c:when>
		<c:otherwise><jsp:include
				page="/partials/toastSuccess.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>

</c:if>

