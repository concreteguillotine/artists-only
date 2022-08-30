Rails.application.routes.draw do
  devise_for :users
 
  root "home#index"

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :conversations
  end

  resources :users do
    resources :conversations
  end
end
