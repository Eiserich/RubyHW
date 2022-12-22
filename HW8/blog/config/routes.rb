Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      root to: 'articles#index_all'
      resources :authors do
        get :published_comments
        get :unpublished_comments
      end
      resources :articles
      resources :likes
      resources :comments do
        patch :change_status
      end
      resources :tags
    end
  end
end
