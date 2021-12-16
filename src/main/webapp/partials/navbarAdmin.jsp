<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<nav id="menu"
	class="navbar  fixed-top  shadow navbar-light bg-light px-5">



	<ul class="nav navbar-nav navbar-center ">
		<span class="navbar-text fs-4">  Administrador</span>
	</ul>

	<ul class="nav navbar-nav navbar-center ">
		<span class="navbar-text fs-4">  LA FUERZA</span>
	</ul>



	<form class="form-inline my-2 my-lg-0 px-3">
		<button type="button" class="btn btn-outline-primary my-2 my-sm-0"
			data-bs-toggle="modal" data-bs-target="#userModal">${usuario.nombre}</button>
	</form>

</nav>