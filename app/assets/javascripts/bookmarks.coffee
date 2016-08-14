# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  # if $('.digg_pagination, .pagination').length
  #   $(window).scroll ->
  #     url =  $('.pagination .next_page').attr('href');
  #     if url && $(window).scrollTop() > $(document).height() - $(window).height() - 150
  #       $('.pagination').text("Fetching more bookmarks")
  #       $.getScript(url)
  #   $(window).scroll()
  if $('.digg_pagination').length
    $(window).scroll ->
      url =  $('.digg_pagination .next_page').attr('href');
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 150
        $('.digg_pagination').text("Fetching more bookmarks")
        $.getScript(url)
    $(window).scroll()
