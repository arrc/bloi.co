class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    pp params
    @bookmarks = current_user.bookmarks.friendly.all.includes(:topic, :flag)
  end

  def show
  end

  def new
    @bookmark = Bookmark.new

    if params[:url]
      pp "render other template"
      Rails.logger.info "Extension template."
      render 'bookmarks/form_for_extension', {bookmark: @bookmark}
    end
  # the block of code below are left for future references.
    # request.query_parameters
    # params.each do |key,value|
    #   Rails.logger.warn "Param from chrome -> #{key}: #{value}"
    # end
  end

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    # @bookmark = Bookmark.new(bookmark_params)
    # @bookmark.user_id = current_user.id
    if @bookmark.save
      redirect_to bookmark_path(current_user, @bookmark), notice: "Bookmark saved."
    else
      render :new, error: "Fix the errors."
    end
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to bookmark_path(current_user, @bookmark), notice: "Updated succefully."
    else
      render :edit, error: "Fix the errors"
    end
  end

  def destroy
  end

  def method
    #code
  end

private

  def set_bookmark
    @bookmark = Bookmark.friendly.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:url, :title, :flag_id, :topic_id, :topic_name, :description, :slug)
  end
end
