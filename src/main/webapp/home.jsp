<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="partials/head.jsp"></jsp:include>
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.css"
	rel="stylesheet" />
<link href="assets/css/home.css" rel="stylesheet" />

<script defer type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>

</head>
<body>


	<div id="back" class="bg-image">

		<div id="botones">


			<div class="d-flex justify-content-center bd-highlight mb-3">

				<div class="p-2">
					<div class="mb-3 p-3 rounded fondoTransparente">
						<h3>¿DE QUE LADO ESTAS?</h3>
					</div>
				</div>
			</div>
			<div
				class="d-flex justify-content-around bd-highlight example-parent ">
				<div class="p-2 d-flex flex-column align-items-center">
					<div class="fondoTransparente  rounded iconos text-center">
						<img class="m-3 logos"
							src="assets/img/home/light.png">
					</div>
					<div class="mt-2">
						<form method="get" action="guest">
							<button type="submit"
								class="btn fondoTransparente rounded btn-lg mt-2 iconos"
								value="Lado Luminoso" name="lado">LUMINOSO</button>
						</form>
					</div>
				</div>

				<div class="p-2 d-flex flex-column align-items-center">
					<div class="fondoTransparente  rounded iconos text-center">
						<img class="m-3 logos"
							src="assets/img/home/dark.png">
					</div>
					<div class="mt-2">

						<form method="get" action="guest">
							<button type="submit"
								class="btn fondoTransparente rounded btn-lg mt-2 iconos"
								value="Lado Oscuro" name="lado">OSCURO</button>
						</form>

					</div>
				</div>

			</div>

		</div>


	</div>
</body>
</html>