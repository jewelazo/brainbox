Rails.application.routes.draw do
  root "users#index"
  # resources :users
  resources :comments
  resources :users do
    resources :comments
  end
end
