Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :categories
  get '/income', to: "categories#income"
  get '/expense', to: "categories#expense"
  get '/search', to: "users#update"
end
