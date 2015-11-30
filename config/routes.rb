Rails.application.routes.draw do
  devise_for :users
  root :to => 'murals#index'
  get "/about" => "murals#about"

  resources :murals
  resources :map
end
