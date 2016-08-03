# == Route Map
#
#                   Prefix Verb   URI Pattern                             Controller#Action
#                     root GET    /                                       pages#home
#            user_password POST   /users/password(.:format)               devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)           devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)          devise/passwords#edit
#                          PATCH  /users/password(.:format)               devise/passwords#update
#                          PUT    /users/password(.:format)               devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                 devise/registrations#cancel
#        user_registration POST   /users(.:format)                        devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                   devise/registrations#edit
#                          PATCH  /users(.:format)                        devise/registrations#update
#                          PUT    /users(.:format)                        devise/registrations#update
#                          DELETE /users(.:format)                        devise/registrations#destroy
#         new_user_session GET    /login(.:format)                        users/sessions#new
#             user_session POST   /login(.:format)                        users/sessions#create
#     destroy_user_session DELETE /logout(.:format)                       users/sessions#destroy
#            bookmarks_new GET    /bookmarks/new(.:format)                bookmarks#new
#                    about GET    /about(.:format)                        pages#about
#                  contact GET    /contact(.:format)                      pages#contact
#                      faq GET    /faq(.:format)                          pages#faq
#                     help GET    /help(.:format)                         pages#help
#                          GET    /:username(.:format)                    users#show
#                bookmarks GET    /:username/bookmarks(.:format)          bookmarks#index
#                          POST   /:username/bookmarks(.:format)          bookmarks#create
#             new_bookmark GET    /:username/bookmarks/new(.:format)      bookmarks#new
#            edit_bookmark GET    /:username/bookmarks/:id/edit(.:format) bookmarks#edit
#                 bookmark GET    /:username/bookmarks/:id(.:format)      bookmarks#show
#                          PATCH  /:username/bookmarks/:id(.:format)      bookmarks#update
#                          PUT    /:username/bookmarks/:id(.:format)      bookmarks#update
#                          DELETE /:username/bookmarks/:id(.:format)      bookmarks#destroy
#                   topics GET    /:username/topics(.:format)             topics#index
#                          POST   /:username/topics(.:format)             topics#create
#                new_topic GET    /:username/topics/new(.:format)         topics#new
#               edit_topic GET    /:username/topics/:id/edit(.:format)    topics#edit
#                    topic GET    /:username/topics/:id(.:format)         topics#show
#                          PATCH  /:username/topics/:id(.:format)         topics#update
#                          PUT    /:username/topics/:id(.:format)         topics#update
#                          DELETE /:username/topics/:id(.:format)         topics#destroy
#

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

get 'bookmarks/new', to: "bookmarks#new"

# Static pages
  %w[about contact faq help].each do |page|
    get page, controller: "pages", action: page
  end

  scope ":username" do
    get '', to: "users#show"
    resources :bookmarks
    resources :topics
    # resources :pages
  end

  # get '/:username', :controller => 'users', :action => 'show'
end
