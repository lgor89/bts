Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :categories
  get '/income', to: "categories#income"
  get '/expense', to: "categories#expense"
  get '/search', to: "users#update"
  post 'users/:id', to: "users#get_date", as: :get_date
  post 'categories/new', to: "categories#get_category_date", as: :get_category_date
end
