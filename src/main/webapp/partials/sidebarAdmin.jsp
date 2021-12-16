
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/assets/css/sidebarAdmin.css" rel="stylesheet" />
<link href="/assets/css/admin.css" rel="stylesheet" />

<div class="offcanvas offcanvas-start show " tabindex="-1"
	id="offcanvas" data-bs-scroll="true" data-bs-backdrop="false" 
	aria-labelledby="offcanvasScrollingLabel">

	<div class="offcanvas-body px-0 ">


		<div class="" id="sidebar-wrapper">

			<div class="list-group list-group-flush lead ">

				<a
					class="list-group-item list-group-item-action py-4 "
					href="#!"><i class="fas fa-chart-line mx-3"></i>Dashboard</a> 
				<a
					class="list-group-item list-group-item-action py-4 "
					href="/usuarios/index.do"><i class="fas fa-user mx-3"></i>Usuarios</a> 
				<a
					class="list-group-item list-group-item-action py-4"
					href="/attractions?partial=atracciones"><i class="fas fa-jedi mx-3"></i>Atracciones</a>
				<a
					class="list-group-item list-group-item-action py-4"
					href="/promociones?partial=promociones"><i class="fas fa-tags mx-3"></i>Promociones</a>
				<a
					class="list-group-item list-group-item-action py-4 "
					href="/usuarios/comprasTodosUsuarios.do"><i class="fas fa-money-bill-wave mx-3"></i></i>Ventas</a>
									<a
					class="list-group-item list-group-item-action py-4"
					href="#!"><i class="far fa-envelope mx-3"></i>Mensajes</a> 
		

			</div>
		</div>

	</div>
</div>





