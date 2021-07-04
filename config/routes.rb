Rails.application.routes.draw do
  get 'password/reset'
  post 'password/reset'
  
  get 'password/forgot'
  post 'password/forgot'
  
  resources :users
  
  get 'home/index'
  get 'home/login'
  get 'home/logout'
  post 'home/login'
  post 'home/index'
  
  root 'home#index'
end
Style Selections San Terra Set of 2 Black Metal Frame Spring Motion Conversation Chair(s) with Red Slat Seat