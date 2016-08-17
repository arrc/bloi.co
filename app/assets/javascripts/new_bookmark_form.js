// bl_bookmark__new--extension__form--new_topic--input
$(document).ready(function(){
  var new_topic = $(".bl_bookmark__new--extension__form--new_topic--input").hide();
  $(".bl_bookmark__new--extension__form--new_topic--toggle").click(function(){
    $("#topic-select").toggle();
    new_topic.toggle();
  });

});
