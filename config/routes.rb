Rails.application.routes.draw do

  get 'register', to: 'sessions#register'
  get 'login', to: 'sessions#login'

  # get 'sessions/register'
  # get 'sessions/login'

  get 'users/index'
  get 'users/show'
  
end
