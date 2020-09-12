Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :new, :create]
  end
  resources :shipments, only: [:new, :create]
  resources :users, only:[:new, :create, :destroy]
end
