Rails.application.routes.draw do
  resources :users
  resources :projects
  resources :funds
  resources :rewards
  resources :comments

end
