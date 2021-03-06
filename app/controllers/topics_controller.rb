class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # TODO - search for bookmars.title & url
    # TODO - consider pagination for topics
    # TODO - limit urls to 5 for each topic
    # TODO - create scopes
    @topics = current_user.topics.includes(:bookmarks)
    if params[:search]
      @topics = @topics.where("name ilike ?", "%#{params[:search]}%")
    else
      @topics
    end
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topic_path(current_user, @topic), notice: "Topic saved."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_path(current_user, @topic), notice: "Updated succefully."
    else
      render :edit
    end
  end

  def destroy
    if @topic.destroy
      redirect_to topics_path(current_user), notice: "Deleted succefully."
    else
      redirect_to topics_path(current_user), notice: "Failed to delete."
    end
  end

private

  def set_topic
    @topic = Topic.friendly.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :description, :is_public, :slug)
  end
end
