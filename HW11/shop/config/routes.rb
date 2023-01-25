Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'

  get 'cart', to: 'carts#show', as: :cart
  resources :line_items, only: %i[create destroy]
  post 'line_items/:id/add_quantity', to: 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce_quantity', to: 'line_items#reduce_quantity', as: 'line_item_reduce'
  resources :orders, only: %i[index create show destroy]
  patch 'orders/:id/change_status', to: 'orders#change_status', as: 'order_pay'
end
