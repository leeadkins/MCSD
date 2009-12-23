//MCSD Admin Javascript. Wooty woo.

var page = 0;

$(document).ready(function() {
	page = 0;
	setupClickHandlers();
});


//These are the click handlers for the little left, right buttons
function setupClickHandlers(){
	$("a#nextlink").click(function(){
		page++;
		if (page > 4) page = 0;
		currentleft = -225 * page;
		currentleft += 'px';
		$("#innermenu").animate({left:currentleft},500);
	});
	$("a#previouslink").click(function(){
		page--;
		if (page < 0) page = 4;
		currentleft = -225 * page;
		currentleft += 'px';
		$("#innermenu").animate({left:currentleft},500);
	});
	
}