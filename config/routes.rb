Rails.application.routes.draw do
  resources :rental_applications, except: [:edit, :update]
  resources :apartments, only: [:index, :show]
  resources :neighborhoods, only: [:index, :show]
  resources :brokers, only: [:index, :show]
  resources :tenants

  root "tenants#login"

  # GET THE USER THE LOGIN FORM
  get "/index", to: "tenants#index"
  get "/login", to: "tenants#login", as: "login"
  # HANDLE THE LOGIN FORM SUBMISSION
  post "/send_the_form_here", to: "tenants#handle_login"
  delete "/logout", to: "tenants#logout", as: "logout"
  
  
end
