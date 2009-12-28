/* Sakura Form Editor Functions */
function setupFadingLabels(){
  $("label.inlined+input, label.inlined+#excerpt").each(function (type){
		//If JS is turned on, set the inline
		
		$(this).prev("label.inlined").css({'opacity':'0.0'});
		$(this).addClass("inlineset");
		//If there is text already (this is an Edit page)
		//we need to go ahead and set the opacity to 0 of the label
		if ($(this).val() == ""){
			$(this).prev("label.inlined").fadeTo("normal", 0.75);
			//$(this).prev("label.inlined").addClass("hastext");
		}
		$(this).focus(function(){
			//$(this).prev("label.inlined").addClass("focus");
			if ($(this).val() == "")
				$(this).prev("label.inlined").fadeTo("normal", 0.35);
		});
		
		$(this).keypress(function(){
			//$(this).prev("label.inlined").addClass("hastext").removeClass("focus");
			$(".tooltip").remove();
			$(this).prev("label.inlined").fadeTo("fast", 0.0);
		});
		
		$(this).blur(function(){
			if($(this).val()==""){
				//$(this).prev("label.inlined").removeClass("hastext").removeClass("focus");
				$(this).prev("label.inlined").fadeTo("normal", 0.75);
			}
		});
	});
}

function setupTooltips(){
  $("input").each(function(type){
    //For each of the inputs we've got inline info about
    //first, we want to make sure it has a label title.
    //if not, don't show the tooltip
    if ($(this).prev("label").attr("title")){
      $(this).hover(
        function (e) {
          tip = document.createElement("div");
        
          $(tip).html($(this).prev("label").attr("title"));
          $(tip).css({'z-index':3,'padding':'10px','position':'absolute'});
          //Now, set the position
        
          $(tip).addClass("tooltip");
          xpos = parseInt($(tip).width());
          $(tip).css({'top': e.pageY+30, 'left': (e.pageX-(xpos/2))});
          $("body").append(tip);
          $().mousemove(function(e){
            xpos = parseInt($(tip).width());
             $(tip).css("top", e.pageY+30);
             $(tip).css("left", (e.pageX-(xpos/2)));
          });
        }, 
        function (e) {
          $(".tooltip").remove();
        }
      );
    }
  });
}

$(document).ready(function()	{
    //$('#markdown').markItUp(myMarkdownSettings);
  try{
	CKEDITOR.replace( 'body',
	    {
	        filebrowserImageBrowseUrl : '/admin/dashboard/browser',
	        filebrowserImageUploadUrl : '/admin/upload',
	        filebrowserImageWindowWidth : '680',
	        filebrowserImageWindowHeight : '480'
	    });
    }
	catch(err){}
	setupFadingLabels();
	setupTooltips();
});

