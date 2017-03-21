Rails.application.routes.draw do
  
  get "/", to: 'products#index'

  
  get "/products", to: 'products#index'
  get "/products/new", to: 'products#new'
  get "/products/:id", to: 'products#show'
  post "/products/search", to: 'products#search'
  post "/products", to: 'products#create'
  get "/products/:id/edit", to: 'products#edit'
  patch "/products/:id",to: 'products#update'
  delete "//products/:id", to: 'products#destroy'

  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/comments", to: 'comments#new'
  post "/comments", to: 'comments#create'

  get "/orders/:id", to: "orders#show"
  patch "/orders/:id", to: 'orders#update'

    post "/carted_products", to: 'carted_products#create'
  get "/carted_products", to: 'carted_products#index'
  delete "/carted_products/:id", to: 'carted_products#destroy'
end

