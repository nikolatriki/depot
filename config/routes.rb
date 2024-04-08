Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :line_items do
    post 'increment_quantity', on: :member
    post 'decrement_quantity', on: :member
  end
  resources :carts
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "store#index", as: "store_index"
end
