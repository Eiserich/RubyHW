# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'products#index'
  get '/cart', to: 'carts#show', as: :cart

  resources :products
  resources :categories
  resources :line_items, only: %i[create update destroy]

  resources :orders
  patch '/orders/:id/pay', to: 'orders#pay', as: 'order_paid'
end
