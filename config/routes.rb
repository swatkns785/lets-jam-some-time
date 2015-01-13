Rails.application.routes.draw do

  root to: "homes#index"
  get 'auth/soundcloud/callback', to: "sessions#create"
  get 'auth/failure', to: "sessions#failure"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:show]
  resources :jamsessions

end
