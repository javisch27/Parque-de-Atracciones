
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/LaFuerza-Turismo/assets/css/sidebarAdmin.css" rel="stylesheet" />

<div class="offcanvas offcanvas-start show " tabindex="-1"
	id="offcanvas" data-bs-scroll="true" data-bs-backdrop="false" 
	aria-labelledby="offcanvasScrollingLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title d-none d-sm-block text-end " id="offcanvas">Menu</h5>

	</div>
	<div class="offcanvas-body px-0">


		<div class="border-end " id="sidebar-wrapper">

			<div class="list-group list-group-flush lead ">

				<a
					class="list-group-item list-group-item-action py-4"
					<c:choose><c:when test="${usuario == null}">href="home.jsp"</c:when><c:otherwise>href="/LaFuerza-Turismo/index2.jsp"</c:otherwise></c:choose>>Home</a>
				<a
					class="list-group-item list-group-item-action py-4 "
					href="#!">La Fuerza</a> 
				<a
					class="list-group-item list-group-item-action py-4"
					href="/LaFuerza-Turismo/attractions?lado=LADO+OSCURO">Atracciones</a>
				<a
					class="list-group-item list-group-item-action py-4"
					href="/LaFuerza-Turismo/promociones?lado=LADO+OSCURO&slider=true">Promociones</a>
				<a
					class="list-group-item list-group-item-action py-4"
					href="#!">Nosotros</a>
				<a
					class="list-group-item list-group-item-action py-4"
					href="#!">contacto</a>




			</div>
		</div>



	</div>
</div>





