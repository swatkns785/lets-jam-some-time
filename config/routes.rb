Rails.application.routes.draw do

  root to: "homes#index"
  get 'auth/soundcloud/callback', to: "sessions#create"
  get 'auth/failure', to: "sessions#failure"

  resources :users, only: [:show]
  resources :jamsessions, only: [:new, :create, :show]

end
