class UsersController < ApplicationController
  def show
    @user = User.find(params[:username])
    @topics = @user.topics.where(is_public: true).includes(:bookmarks)
  end
end
