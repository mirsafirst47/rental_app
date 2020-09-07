Rails.application.routes.draw do
  resources :rental_applications, except: [:edit, :update]
  resources :apartments, only: [:index, :show]
  resources :neighborhoods, only: [:index, :show]
  resources :brokers
  resources :tenants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
