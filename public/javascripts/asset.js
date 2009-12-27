//Ravsonic Sakura Asset Browser
//Requires jQuery, and it should have already been imported 
//by the time you load this up

$(document).ready(function()	{
  //Load first set of images
  //setup some click handlers
  $("#assetlinks a").click(function(){
    window.opener.CKEDITOR.tools.callFunction(ckcallback,$(this).attr("href"));
    self.close();
    return false;
  });
});

