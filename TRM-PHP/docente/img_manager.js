/**
 * Mostra l'immagina appena inserita
 */
function show_img() {
	var img = document.getElementById("img_show");

	var selector = document.getElementById("image_selector");

	var file = selector.files[0];

	const reader = new FileReader();
	reader.onload = (function (aImg) {
		return function (e) {
			aImg.src = e.target.result;
		};
	})(img);
	reader.readAsDataURL(file);

	// mostro l'immagine e nascondo l'input
	img.style.display = "block";
	selector.style.display = "none";
}

/**
 * clicca l'input immagine in caso sia nascosto dall'immagine
 */
function click_image() {
	document.getElementById("image_selector").click();
}

/**
 * Mostra l'immagina appena inserita
 */
function show_img_id(id) {
	var img = document.getElementById("img_show-" + id);

	var selector = document.getElementById("image_selector-" + id);

	var file = selector.files[0];

	const reader = new FileReader();
	reader.onload = (function (aImg) {
		return function (e) {
			aImg.src = e.target.result;
		};
	})(img);
	reader.readAsDataURL(file);

	// mostro l'immagine e nascondo l'input
	img.style.display = "block";
	selector.style.display = "none";
}

/**
 * clicca l'input immagine in caso sia nascosto dall'immagine
 */
function click_image_id(id) {
	document.getElementById("image_selector-" + id).click();
}

function fix_default_img() {
	var img = document.getElementById("img_show");

	var selector = document.getElementById("image_selector");

	// se non e' l'immagine di default tutto ok
	if (img.src != "http://localhost/sources/TRM-PHP/images/") {
		selector.style.display = "none";
	}
}

function fix_default_img_id(id) {
	var img = document.getElementById("img_show-" + id);

	var selector = document.getElementById("image_selector-" + id);

	// se non e' l'immagine di default tutto ok
	if (img.src != "http://localhost/sources/TRM-PHP/images/" && img.src != "http://localhost/") {
		selector.style.display = "none";
	}
}
