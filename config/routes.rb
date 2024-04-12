Rails.application.routes.draw do
  get 'admin/index'

  controller 'sessions' do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :orders
  resources :line_items do
    post 'increment_quantity', on: :member
    post 'decrement_quantity', on: :member
  end
  resources :carts
  resources :products

  resources :support_requests, only: [:index, :update]

  root 'store#index', as: 'store_index'
end
