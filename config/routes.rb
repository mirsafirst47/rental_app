Rails.application.routes.draw do
  resources :rental_applications
  resources :apartments
  resources :neighborhoods
  resources :brokers
  resources :tenants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
