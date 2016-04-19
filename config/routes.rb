Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :cart_items, only: [:create]
  resources :users, only: [:new, :create]

  root to: 'items#static'

  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/cart', to: 'cart_items#index'
  get '/:category', to: 'categories#show'
end
