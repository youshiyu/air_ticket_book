
	var nav = document.getElementById("nav");
	var oDiv = document.getElementById("oDiv");


	nav.onclick = function(){
		oDiv.style.display = (oDiv.style.display == "block") ? "none": "block";
	}
		
		
		
		/*
		function(e) {
		
		var src = e ? e.target : event.srcElement;
		if (src.tagName == "H3") {
			var next = src.nextElementSibling || src.nextSibling;
			next.style.display = (next.style.display == "block") ? "none": "block";
		}
		//$("oDiv").style.display = ($("oDiv").style.display == "block") ? "none": "block";
	
	*/
	
