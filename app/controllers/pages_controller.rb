class PagesController < ApplicationController

  layout 'home', only: [:home]

  def home
    if current_user
      redirect_to bookmarks_path(current_user)
    end
  end

  def about
  end

  def contact
  end

  def faq
  end

  def help
  end
end
