Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  # resources :users
  resources :comments
  resources :users do
    resources :comments
  end
end
