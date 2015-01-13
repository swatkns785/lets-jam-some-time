Rails.application.routes.draw do

  root to: "homes#index"
  get 'auth/soundcloud/callback', to: "sessions#create"
  get 'auth/failure', to: "sessions#failure"

  resources :users, only: [:show]

end
