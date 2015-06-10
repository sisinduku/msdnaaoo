/**
 * JavaScript custom yang dibutuhkan dijadikan satu dalam file ini
 */
$(document).ready(function(){
	var activePage = Globals.activePage;
	var spanNode = document.createElement("SPAN");
	var spanText = document.createTextNode("(current)");
	spanNode.className = "sr-only";
	spanNode.appendChild(spanText);
	
	document.getElementById(activePage).className = "active";
	document.getElementById(activePage).firstChild.appendChild(spanNode);
});
