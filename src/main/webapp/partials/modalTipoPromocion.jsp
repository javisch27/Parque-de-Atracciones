<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/assets/css/login-modal.css" rel="stylesheet" />


<div class="modal fade" id="promotionModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">

				<h5 class="modal-title" id="exampleModalLabel">Login</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>


			<div class="modal-body">

				<div class="list-group list-group-flush lead ">
					<a
						class="list-group-item list-group-item-action list-group-item-light  p-3 text text-dark"
						href="/attractions?lado=LADO+LUMINOSO">Promoción Absoluta</a> <a
						class="list-group-item list-group-item-action list-group-item-light  p-3 text text-dark"
						href="/promociones?lado=LADO+LUMINOSO">Promoción AXB</a> <a
						class="list-group-item list-group-item-action list-group-item-light   p-3 text text-dark"
						href="#!">Promoción Porcentual </a>
				</div>

			</div>
		</div>
	</div>
</div>