Rails.application.routes.draw do

  resources :tenants
  resources :rental_applications, except: [:edit, :update]
  resources :apartments, only: [:index, :show]
  resources :neighborhoods, only: [:index, :show]
  resources :brokers, only: [:index, :show]
  

  root 'tenants#login'
  get 'welcome/index', to: 'welcome#index'
  # root 'welcome#index'
  
  get '/profile', to: 'tenants#profile', as: 'profile'

  # GET THE USER THE LOGIN FORM
  # get "/index", to: "tenants#index"
  get '/login', to: 'tenants#login', as: 'login'
  # HANDLE THE LOGIN FORM SUBMISSION
  post '/send_the_form_here', to: 'tenants#handle_login'
  delete '/logout', to: 'tenants#logout', as: 'logout'

  get '/rental_application/apartment/:apt_id', to: 'rental_applications#new_form', as: 'apartment_id'
  
end
