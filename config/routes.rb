Rails.application.routes.draw do

  root :to => 'projects#index'

  resources :users

  resources :projects do
    resources :funds
    resources :comments
  end

  resources :rewards


  resources :user_sessions
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

end
