Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :authors do
      end
      esources :tags do
      resources :articles do
      end
      resources :comments do
        get :change_status, to: 'comments#switch_status', on: :member
        get :unpublished, on: :collection
        get :published, on: :collection
      end
    end
  end
end
