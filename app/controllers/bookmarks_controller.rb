class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # TODO - consider moving seach and paging code to model
    @bookmarks = current_user.bookmarks
    if params[:search]
      @bookmarks = @bookmarks.search(params[:search]).includes(:topic, :flag).order("created_at DESC").page(params[:page]).per_page(10)
    else
      @bookmarks = @bookmarks.includes(:topic, :flag).order("created_at DESC").page(params[:page]).per_page(10)
    end
  end

  def show
  end

  def new
    @bookmark = Bookmark.new

    if params[:url]
      Rails.logger.info "Extension template."
      render 'bookmarks/form_for_extension', {bookmark: @bookmark}
    end
  ### the block of code below is left for future references.
    # request.query_parameters
    # params.each do |key,value|
    #   Rails.logger.warn "Param from chrome -> #{key}: #{value}"
    # end
  end

  def create
    # binding.pry
    @bookmark = current_user.bookmarks.build(bookmark_params)

    # ensure 'topic_name' exists otherwise it sets the 'topic_id' to nil
    if params[:topic_name].present?
      new_topic = current_user.topics.find_or_create_by(name: params[:topic_name])
      @bookmark.topic_id = new_topic.id
    end

    if @bookmark.save
      redirect_to bookmark_path(current_user, @bookmark), notice: "Bookmark saved."
    else
      render :new, notice: "Fix the errors."
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
    @bookmark.destroy
    redirect_to bookmarks_path(current_user), notice: "Bookmark delted."
  end

private

  def set_bookmark
    @bookmark = Bookmark.friendly.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:url, :title, :flag_id, :favicon, :hostname, :topic_id, :topic_name, :description, :slug, topics_attributes: [:id, :name])
  end
end
