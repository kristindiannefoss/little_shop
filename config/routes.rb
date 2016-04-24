Rails.application.routes.draw do

  root to: "pages#splash"

  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create]
  resources :cart_items, only: [:create, :destroy, :update, :edit]
  resources :orders, only: [:index, :create]

  get "/order", to: "orders#show"
  get "/dashboard", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/cart", to: "cart_items#index"
  get "/:category", to: "categories#show"
  get "/*page", to: "errors#not_found"

end
