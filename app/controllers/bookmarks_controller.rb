class BookmarksController < ApplicationController
  before_action :set_aircraft, only: [:show, :edit, :update, :destroy]

  def index
    pp params
    @bookmarks = Bookmark.all.includes(:topic, :flag)
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id
    if @bookmark.save
      redirect_to bookmark_path(current_user, @bookmark), notice: "Bookmark saved."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to bookmark_path(current_user, @bookmark), notice: "Updated succefully."
    else
      render :edit
    end
  end

  def destroy
  end

private

  def set_aircraft
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:url, :flag_id, :topic_id, :topic_name, :description)
  end
end
