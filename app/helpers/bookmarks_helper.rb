module BookmarksHelper

  def set_url

  end

  def flag_color(flag)
    if flag == 1 # important
      flag_color = "bl_bookmarks__item--flag__important ion-record"
    elsif flag == 2 # very important
      flag_color = "bl_bookmarks__item--flag__very-important ion-record"
    elsif flag == 3 # normal
      flag_color = "bl_bookmarks__item--flag__normal ion-record"
    end
  end

end
