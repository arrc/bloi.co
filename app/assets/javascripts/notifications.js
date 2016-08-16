$(document).ready(function(){
  setTimeout(function(){
    $('.bl_flash_messages').fadeOut("slow", function(){
      $(this).remove();
    })
  }, 3000);
});
