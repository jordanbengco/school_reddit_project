Rails.application.routes.draw do

  resources :categories
  root 'main#index'
  resources :users, param: :slug
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :articles do
    resources :comments
    resources :likes
    resources :dislikes
  end

  # Uncomment if needed
  # devise_for :users
  # Messaging between users
  resources :conversations do
    resources :messages
  end
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'edit', to: 'users#edit', as: 'edit'
  get 'store', to: 'store_item#index', as: 'store'
  post 'buy' => 'store_item#buy', as: :'buy'

end
