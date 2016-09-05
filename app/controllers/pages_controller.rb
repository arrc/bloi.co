class PagesController < ApplicationController

  layout 'home', only: [:home]

  def home
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
