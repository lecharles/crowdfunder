Rails.application.routes.draw do

  root :to => 'projects#index'

  resources :users

  resources :projects

  resources :funds

  resources :rewards

  resources :comments

  resources :user_sessions
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

end
