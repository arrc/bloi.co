Rails.application.routes.draw do
  root 'pages#home'

# Devise
  devise_for :users, skip: [:sessions], controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get "login" => "users/sessions#new", as: :new_user_session
    post "login" => "users/sessions#create", as: :user_session
    delete "logout" => "users/sessions#destroy", as: :destroy_user_session
  end

#

# Static pages
  %w[about contact faq help].each do |page|
    get page, controller: "pages", action: page
  end

  resources :bookmarks, :path_prefix => '/:username' do |bm|
    # question.resources :answers
  end

  resources :topics, path_prefix: "/:username"
  resources :pages, path_prefix: "/:username"

  get '/:username', :controller => 'users', :action => 'show'
end
