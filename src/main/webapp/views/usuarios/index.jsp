
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


		<div class="bg-light p-4 mb-3 rounded">
			<h1>Estas son las usuarios de la Fuerza</h1>
		</div>

		<jsp:include page="/partials/listadoUsuarios.jsp"></jsp:include>

	</main>


<jsp:include page="/partials/mensajes.jsp"></jsp:include>

</body>
</html>