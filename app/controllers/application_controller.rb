class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
   bookmarks_path(current_user)
  end

  def after_sign_up_path_for(resource)
    # after_sign_in_path_for(resource)
    bookmarks_path(current_user)
  end

  protected

  def configure_permitted_parameters
    # added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :profile_picture]
    devise_parameter_sanitizer.permit :sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me, :profile_picture]
    devise_parameter_sanitizer.permit :sign_in, keys: [:username, :password, :password_confirmation, :remember_me, :profile_picture]
    devise_parameter_sanitizer.permit :account_update, keys: [:email, :password, :current_password, :profile_picture, :profile_picture_cache, :profile_picture_cache]
  end
end
