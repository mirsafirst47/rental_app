Rails.application.routes.draw do
  resources :rental_applications
  resources :apartments
  resources :neighborhoods
  resources :brokers
  resources :tenants

  root "tenants#login"

  # GET THE USER THE LOGIN FORM
  get "/index", to: "tenants#index"
  get "/login", to: "tenants#login", as: "login"
  # HANDLE THE LOGIN FORM SUBMISSION
  post "/send_the_form_here", to: "tenants#handle_login"
  delete "/logout", to: "tenants#logout", as: "logout"
  
  
end
