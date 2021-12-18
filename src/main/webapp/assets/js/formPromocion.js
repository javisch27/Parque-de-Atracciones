
function tipoAtraccion() {

	let lado = document.getElementById("tipoAtraccion").value;


	if (lado === "LADO_LUMINOSO") {

		document.getElementById("chechLuminoso").classList.remove('d-none');
		document.getElementById("chechOscuro").classList.add('d-none');
		document.getElementById("chechLuminosoAXB").classList.remove('d-none');
		document.getElementById("chechOscuroAXB").classList.add('d-none');

	} else if (lado === "LADO_OSCURO") {

		document.getElementById("chechOscuro").classList.remove('d-none');
		document.getElementById("chechLuminoso").classList.add('d-none');
		document.getElementById("chechOscuroAXB").classList.remove('d-none');
		document.getElementById("chechLuminosoAXB").classList.add('d-none');

	} else {

		document.getElementById("chechLuminoso").classList.add('d-none');
		document.getElementById("chechOscuro").classList.add('d-none');
		document.getElementById("chechLuminosoAXB").classList.add('d-none');
		document.getElementById("chechOscuroAXB").classList.add('d-none');
	}

}




function deschequearItems() {
	let formularios = document.querySelectorAll('input[type=checkbox');
	formularios.forEach(function(r) {
		r.checked = false;

	});

}


function mostrarImputVariable() {

	let tipoPromocion = document.getElementById("tipoPromocion").value;


	if (tipoPromocion === "AXB") {

		document.getElementById("listaCheckAXB").classList.remove('d-none');
		document.getElementById("listaCheckAXB").setAttribute("required", "");
		document.getElementById("promosConVariables").removeAttribute("required");
		document.getElementById("promosConVariables").classList.add('d-none');


	} else {
		document.getElementById("listaCheckAXB").removeAttribute("required");
		document.getElementById("listaCheckAXB").classList.add('d-none');
		document.getElementById("promosConVariables").classList.remove('d-none');
		document.getElementById("promosConVariables").setAttribute("required", "");

		if (tipoPromocion === "ABSOLUTA") {
			document.getElementById("variable").textContent = "Costo Total";

		} else if (tipoPromocion === "PORCENTUAL") {
			document.getElementById("variable").textContent = "Porcentaje de Descuento";

		} else {
			document.getElementById("promosConVariables").classList.add('d-none');
		}

	}

}




function limpiarCasillerosYcambiarListas() {
	deschequearItems();
	tipoAtraccion();

}

function cargarSelccionCheckAXB() {

	let seleccion2 = [];

	let items2 = document.querySelectorAll('.checkAXB');
	items2.forEach(function(r) {

		if (r.checked) {

			seleccion2.push(+r.name)

		} else {
			let index2 = seleccion2.indexOf(+r.id);
			if (index2 > -1) {
				seleccion2.splice(index2, 1);
			}

		}

	});
	
	console.log(seleccion2)

	document.getElementById("atraccionesGratisPromoAXB").value = seleccion2;

}


function cargarSelccionCheck() {
	
	
	let seleccion = [];

	let items = document.querySelectorAll('.check');
	items.forEach(function(r) {

		if (r.checked) {

			seleccion.push(+r.name);


		} else {
			let index = seleccion.indexOf(+r.id);
			if (index > -1) {
				seleccion.splice(index, 1);
			}

		}

	});

	
	console.log(seleccion)
	document.getElementById("atraccionesIncluidas").value = seleccion;


}


function funcionesInicio() {
	let lado = document.getElementById("tipoAtraccion").value;
	mostrarImputVariable();
	tipoAtraccion();
	cargarSelccionCheckAXB();
	cargarSelccionCheck();
}


	document.getElementById("listaCheckAXB").addEventListener("click", cargarSelccionCheckAXB);
	document.getElementById("listaCheck").addEventListener("click", cargarSelccionCheck);
	document.getElementById("tipoPromocion").addEventListener("change", mostrarImputVariable);
	document.getElementById("tipoAtraccion").addEventListener("change", limpiarCasillerosYcambiarListas);
	document.addEventListener("DOMContentLoaded", funcionesInicio);


