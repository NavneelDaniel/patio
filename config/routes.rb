Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "home#welcome"
  get "/menu", to: "menus#index"

  resources :users

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  get "/admin", to: "admin#index"
  put "/admin/c/:id", to: "admin#update_category"
  delete "/admin/c/:id", to: "admin#destroy_category"

  put "/admin/i/:id", to: "admin#update_item"
  delete "/admin/i/:id", to: "admin#destroy_item"

  get "/admin/c_new", to: "admin#get_view_create_menu_category"
  post "/admin/c_new", to: "admin#create_menu_category"

  get "/admin/i_new/:id", to: "admin#get_view_create_menu_item"
  post "/admin/i_new/:id", to: "admin#create_menu_item"

  post "/cart/:id", to: "cart#create"
  post "/cart/ch/:id", to: "cart#checkout"
  put "/cart/a/:id", to: "cart#add"
  put "/cart/s/:id", to: "cart#subtract"
  delete "/cart/:id", to: "cart#destroy"

  get "/orders", to: "orders#display_all"
end
