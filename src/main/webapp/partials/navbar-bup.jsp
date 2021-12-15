<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/LaFuerza-Turismo/assets/css/navguest.css" rel="stylesheet" />

<nav id="menu"
	class="navbar  fixed-top  shadow <c:choose><c:when test="${lado=='LADO OSCURO'}"> navbar-dark bg-dark</c:when>
		<c:otherwise>navbar-light bg-light </c:otherwise></c:choose>">



	<button data-bs-toggle="offcanvas" data-bs-target="#offcanvas"
		role="button"
		class="openbtn px-3<c:choose><c:when test="${lado=='LADO OSCURO'}"> btn btn-dark text-secondary</c:when>
		<c:otherwise>btn btn-light </c:otherwise></c:choose>">☰
		Menu</button>


	<ul class="nav navbar-nav navbar-center ">
		<span class="navbar-text fs-4"> <c:choose>
				<c:when test="${lado=='LADO OSCURO'}"> LADO OSCURO</c:when>
				<c:otherwise>LADO LUMINOSO </c:otherwise>
			</c:choose>
	</ul>


	<c:if test="${usuario != null}">
		<div class="d-flex fondoTransparente rounded justify-content-end px-3">
			<div class="p-2">
				<span class="navbar-text fs-5"> Disponible:</span>
			</div>
			<div class="p-2">
				<span class="navbar-text fs-5">$<c:out
						value="${usuario.presupuestoDisponible}"></c:out></span>
			</div>
			<div class="p-2">
				<span class="navbar-text fs-5"> <c:out
						value="${usuario.tiempoDisponible}"></c:out></span>
			</div>
		</div>
	</c:if>

	<form class="form-inline my-2 my-lg-0 px-3">
		<c:choose>
			<c:when test="${usuario != null}">
				<button type="button" class="btn btn-outline-secondary my-2 my-sm-0"
					data-bs-toggle="modal" data-bs-target="#userModal">${usuario.nombre}</button>

			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-outline-secondary my-2 my-sm-0"
					data-bs-toggle="modal" data-bs-target="#guestModal">Login</button>

			</c:otherwise>
		</c:choose>
	</form>


</nav>