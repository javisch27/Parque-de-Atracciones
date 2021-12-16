
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/assets/css/sidebar.css" rel="stylesheet" />

<div class="offcanvas offcanvas-start sidebarDark
" tabindex="-1"
	id="offcanvas" data-bs-keyboard="true" data-bs-backdrop="true"
	aria-labelledby="offcanvasWithBackdropLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title d-none d-sm-block text-end " id="offcanvas">Menu</h5>
		<button type="button" class="btn-close text-reset"
			data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body px-0">


		<div class="border-end " id="sidebar-wrapper">

			<div class="list-group list-group-flush lead ">

				<a
					class="list-group-item list-group-item-action list-group-item-dark  p-3 text text-dark"
					<c:choose><c:when test="${usuario == null}">href="/guest?lado=LADO+OSCURO"</c:when><c:otherwise>href="/index2.jsp"</c:otherwise></c:choose>>Home</a>
				<a
					class="list-group-item list-group-item-action list-group-item-dark  p-3 text text-dark"
					href="#!">La Fuerza</a> 
				<a
					class="list-group-item list-group-item-action list-group-item-dark  p-3 text text-dark"
					href="/attractions?lado=LADO+OSCURO">Atracciones</a>
				<a
					class="list-group-item list-group-item-action list-group-item-dark  p-3 text text-dark"
					href="/promociones?lado=LADO+OSCURO&slider=true">Promociones</a>
				<a
					class="list-group-item list-group-item-action list-group-item-dark   p-3 text text-dark"
					href="#!">Nosotros</a>
				<a
					class="list-group-item list-group-item-action list-group-item-dark  p-3 text text-dark"
					href="#!">contacto</a>




			</div>
		</div>



	</div>
</div>





