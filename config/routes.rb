Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy], shallow: true do
      resources :comments, only: [:new, :create, :destroy], shallow: true
      resources :likes, only: [:create, :destroy], shallow: true
    end
  end
  root 'users#index'
  
  
  namespace :api, defaults: { format: 'json' } do
    namespace :v0 do
      resources :users, only: :show do
        resources :posts, only: [:index, :show], shallow: true do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end
end  
