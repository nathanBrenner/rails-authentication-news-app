Rails.application.routes.draw do
  resources :users
  get 'home/index'
  get 'home/login'
  post 'home/login'
  post 'home/index'
  root 'home#index'
end
