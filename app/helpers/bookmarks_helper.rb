module BookmarksHelper

  def set_url

  end

  def flag_color(flag)
    if flag == 1 # important
      "bl_bookmarks__item--flag__important ion-record"
    elsif flag == 2 # very important
      "bl_bookmarks__item--flag__very-important ion-record"
    elsif flag == 3 # normal
      "bl_bookmarks__item--flag__normal ion-record"
    end
  end

end
