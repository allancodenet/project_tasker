Rails.application.routes.draw do
  resources :notifications, only: [:index]
  get "/search", to: "search#index"
  devise_for :users
  resources :dashboard, only: [:index]
  resources :projects do
    resources :tasks
  end
  root "home#index"
end
