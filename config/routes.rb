Rails.application.routes.draw do
  root :to => 'murals#index'
  get "/about" => "murals#about"

  resources :murals
  resources :map
end
