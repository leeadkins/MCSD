//Ravsonic Sakura Asset Browser
//Requires jQuery, and it should have already been imported 
//by the time you load this up
var bigdata;
var items = new Array();
var currentpage = 0;
var base = "/system/files/1/medium/1261387728103.jpg"

function getthumb(id, file){
  return "/system/files/" + id + "/thumb/" + file;
}

function getimage(id, file){
  return "/system/files/" + id + "/medium/" + file;
}

$(document).ready(function()	{
  //Load first set of images
  $.getJSON("/admin/assets.json",
    function(data){
      bigdata = data;
      $.each(data, function(i,item){
        //Lef's store some information about the asset in an array
          asset = {'title': item.asset.name, 'description':item.asset.description, 'file':item.asset.file_file_name, 'id':item.asset.id, 'src':getthumb(item.asset.id, item.asset.file_file_name)};
          items[i] = asset;
        $("<li/>").appendTo("#assetlist").attr("id", i).append($("<img/>").attr("src", items[i].src));
      });
    });
  //setup some click handlers
  $("#assetlist li img").live("click", function(){
  	current = items[parseInt($(this).parent().attr("id"))];
  	//$.markItUp(
  	//#	{
  	//	  replaceWith:'![Image]('+current.src  +' "Image")'
  	//	}
  	//);
    window.opener.CKEDITOR.tools.callFunction(ckcallback,current.src);
    self.close();
  });
  
  
});