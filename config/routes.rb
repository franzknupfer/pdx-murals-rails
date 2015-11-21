Rails.application.routes.draw do
  root :to => 'murals#index'
  resources :murals
  resources :map
end
