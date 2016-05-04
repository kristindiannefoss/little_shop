Rails.application.routes.draw do

#
# Module 3 requires you to know URLs, paths and HTTP verbs inside and out. Rewrite the routes file for your Little Shop to use only methods that map directly to HTTP verbs: get, post, put, patch and delete. You will probably need to add to: and as: parameters to make sure your apps continue to work, and tests continue to pass.

  root to: "pages#splash"

  get "/items", to: "items#index"
  get "/items/:id", to: "items#show", as: "item"

  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create", as: "users"

  post "/cart_items", to: "cart_items#create"
  patch "/cart_items/:id", to: "cart_items#update", as: "cart_item"
  put "/cart_items/:id", to: "cart_items#update"
  delete "/cart_items/:id", to: "cart_items#destroy"

  get "/orders", to: "orders#index"
  post "/orders", to: "orders#create"

  get "/admin/items", to: "admin/items#index"
  post "/admin/items", to: "admin/items#create"
  get "/admin/items/new", to: "admin/items#new", as: "new_admin_item"
  get "/admin/items/:id/edit", to: "admin/items#edit", as: "edit_admin_item"
  get "/admin/items/:id", to: "admin/items#show", as: "admin_item"
  patch "/admin/items/:id", to: "admin/items#update"
  put "/admin/items/:id", to: "admin/items#update"
  delete "/admin/items/:id", to: "admin/items#destroy"

  get "admin/users/:id", to: "admin/users#show", as: "admin_user"

  get "/order", to: "orders#show"
  get "/dashboard", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/cart", to: "cart_items#index"
  get "/admin/dashboard", to: "admin/users#show"
  get "/:category", to: "categories#show"
  get "/*page", to: "errors#not_found"
end
