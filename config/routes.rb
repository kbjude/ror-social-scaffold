Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  resources :users, only: [:index, :show] do
    resources :friendships, only: [:create, :destroy] do
      member do
        post 'decline'
        post 'confirm'
      end
    end
  end

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
