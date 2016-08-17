# largely inspired by railscast
jQuery ->
  if $('.digg_pagination').length
    $(window).scroll ->
      url =  $('.digg_pagination .next_page').attr('href');
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 150
        $('.digg_pagination').text("Fetching more items...")
        $.getScript(url)
    $(window).scroll()
