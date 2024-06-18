Rails.application.routes.draw do
  devise_for :users
  resources :dashboard, only: [:index]
  resources :projects
  root "home#index"
end
