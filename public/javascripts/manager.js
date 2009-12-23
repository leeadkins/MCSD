//List Management javascript

function deleteItem(parent){
  //Parent contains a jquery object...
  $.post(parent.attr("href"), function(data){
    parent.parent().parent().remove();
  });
}

