<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script defer type="text/javascript" src="/assets/js/toastMensajes.js"></script>
<link href="/assets/css/toast.css" rel="stylesheet" />

<div class="toast position-fixed top-0 end-0 mx-3" style="z-index: 200">
	<div id="liveToast" class=" " role="alert" aria-live="assertive"
		aria-atomic="true">
		<div class="toast-header bg-success text-white">
			<!--   <img src="..." class="rounded me-2" alt=""> -->
			<strong class="me-auto">Atención</strong>
			<!--  <small>11 mins ago</small> -->
			<button type="button" class="btn-close" data-bs-dismiss="toast"
				aria-label="Close"></button>
		</div>
		<div class="toast-body bg-light">
			<c:out value="${flash}" />


		</div>
	</div>
</div>
