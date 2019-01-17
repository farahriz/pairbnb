Rails.application.routes.draw do
  
  root 'welcome#index'
  
  get 'braintree/new'
  post 'braintree/checkout'
  
  get 'listings/index'
  get 'listings/create'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create, :edit, :update, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end


  resources :listings, only: [:create, :edit, :show, :update, :new, :index, :delete, :destroy]

  resources :reservations, only: [:create, :edit, :show, :update, :new, :index, :delete, :destroy]

  get 'tags/:tag', to: 'listings#index', as: "tag"

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"


  # Google callback
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end