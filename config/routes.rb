Rails.application.routes.draw do
  resources :items, only: [:index, :show]

  resources :users, only: [:new, :create]

  resources :cart_items, only: [:create, :destroy, :update, :edit]

  resources :orders, only: [:index, :show]

  root to: 'pages#splash'

  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/cart', to: 'cart_items#index'
  get '/:category', to: 'categories#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
