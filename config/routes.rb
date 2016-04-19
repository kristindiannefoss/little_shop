Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :cart_items, only: [:create, :destroy]
  get '/cart', to: 'cart_items#index'
  get '/:category', to: 'categories#show'
end
