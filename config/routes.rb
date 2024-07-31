Rails.application.routes.draw do
  resources :teams
  authenticate :user, ->(user) { user.organization_owner? } do
    get "billing", to: "billing#portal"
    resources :subscriptions
    resources :organization_users do
      member do
        post "/change_role", to: "organization_users#change_role"
      end
    end
    mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  end

  authenticate :user, ->(user) { user.admin? } do
    mount GoodJob::Engine => "good_job"
    namespace :admin do
      resources :dashboard do
        post :impersonate, on: :member
        post :stop_impersonating, on: :collection
      end
    end
  end

  get "/calendar", to: "calendar#index"
  resources :notifications, only: [:index]
  get "read_notifications", to: "read_notifications#read_all"
  get "/search", to: "search#index"
  devise_for :users
  resources :dashboard, only: [:index]
  resources :projects do
    resources :tasks
  end
  root "home#index"
end
