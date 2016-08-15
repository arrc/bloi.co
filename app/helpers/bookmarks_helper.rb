module BookmarksHelper

  def set_url

  end

  # TODO refactor it to use case statements instead.
  def flag_color(flag)
    if flag.name == "important" # important
      "bl_bookmarks__item--flag__important ion-record"
    elsif flag.name == "very important" # very important
      "bl_bookmarks__item--flag__very-important ion-record"
    elsif flag.name == "normal" # normal
      "bl_bookmarks__item--flag__normal ion-record"
    end
  end

end
