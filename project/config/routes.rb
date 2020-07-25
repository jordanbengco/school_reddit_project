Rails.application.routes.draw do

  root 'main#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  get 'store', to: 'store_item#index', as: 'store'
  post 'buy' => 'store_item#buy', as: :'buy'
  
end
