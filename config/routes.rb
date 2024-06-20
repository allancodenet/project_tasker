Rails.application.routes.draw do
  devise_for :users
  resources :dashboard, only: [:index]
  resources :projects do
    resources :tasks
  end
  root "home#index"
end
