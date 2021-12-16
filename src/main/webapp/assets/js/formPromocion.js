document.getElementById("tipoPromocion").addEventListener("change", function() {

	let tipoPromocion = document.getElementById("tipoPromocion").value;


	if (tipoPromocion === "AXB") {

		document.getElementById("atraccionesGratis").classList.remove('d-none');
		document.getElementById("atraccionesGratis").setAttribute("required", "");
		document.getElementById("promosConVariables").removeAttribute("required");
		document.getElementById("promosConVariables").classList.add('d-none');


	} else {
		document.getElementById("atraccionesGratis").removeAttribute("required");
		document.getElementById("atraccionesGratis").classList.add('d-none');
		document.getElementById("promosConVariables").classList.remove('d-none');
		document.getElementById("promosConVariables").setAttribute("required", "");

		if (tipoPromocion === "ABSOLUTA") {
			document.getElementById("inputVariable").textContent = "Costo Total";

		} else if (tipoPromocion === "PORCENTUAL") {
			document.getElementById("inputVariable").textContent = "Porcentaje de Descuento";

		} else {
			document.getElementById("promosConVariables").classList.add('d-none');
		}

	}
});


document.getElementById("tipoAtraccion").addEventListener("change", function() {

	let lado = document.getElementById("tipoAtraccion").value;


	if (lado === "LADO_LUMINOSO") {

		document.getElementById("chechLuminoso").classList.remove('d-none');
		document.getElementById("chechOscuro").classList.add('d-none');

	} else if (lado === "LADO_OSCURO") {

		document.getElementById("chechOscuro").classList.remove('d-none');
		document.getElementById("chechLuminoso").classList.add('d-none');

	} else {
		document.getElementById("chechLuminoso").classList.add('d-none');
		document.getElementById("chechOscuro").classList.add('d-none');
	}
});