Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors do
      end
      resources :tags do
        resources :articles do
        end
      end

      resources :articles do
        resources :comments do
        end
      end

      resources :articles do
        resources :likes, only: %i[create destroy]
      end

      resources :articles do
        resources :comments do
          resources :likes, only: %i[create destroy]
        end
      end

    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
