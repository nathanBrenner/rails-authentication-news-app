Rails.application.routes.draw do
  get 'password/reset'
  post 'password/reset'
  
  get 'password/forgot'
  post 'password/forgot'
  
  resources :users
  
  get 'home/index'
  get 'home/login'
  post 'home/login'
  post 'home/index'
  
  root 'home#index'
end
