<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>
<script defer src="https://kit.fontawesome.com/d3e9765b95.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href="/assets/css/formsAdmin.css" rel="stylesheet" />
<jsp:include page="/partials/user-modal.jsp"></jsp:include>

<div class="d-flex">
	<div class="sidebar">
		<div class="sidebar-inner">
			<div class="sidebar-menu scrollable pos-r ps">
				<jsp:include page="/partials/sidebarAdmin.jsp"></jsp:include>
			</div>
		</div>
	</div>


	<div class="container">

		<div class="header navbar">
			<div class="header-container">
				<jsp:include page="/partials/navbarAdmin.jsp"></jsp:include>
			</div>
		</div>



		<c:if test="${atraccion != null && !atraccion.isValid()}">
			<div class="alert alert-danger">
				<p>Se encontraron errores al actualizar la atracción.</p>
			</div>
		</c:if>


		<div id="formulario">
			<form action="/attractions/edit.do" method="post">
				<input type="hidden" name="id_atraccion" value="${atraccion.id_atraccion}">
				<jsp:include page="/views/attractions/form.jsp"></jsp:include>
			</form>
		</div>






	</div>
	<footer></footer>


</div>