Rails.application.routes.draw do

  root to: "homes#index"
  get 'auth/soundcloud/callback', to: "sessions#create"
  get 'auth/failure', to: "sessions#failure"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:show, :edit, :update]

  resources :jamsessions

  resources :jamsessions, only: [:show, :create] do
    resources :attendees, only: [:create]
  end

  resources :jamsessions, only: :show do
    resources :attendees, only: [:update, :destroy]
  end

  resources :jamsessions, only: :show do
    resources :tracks, only: [:new, :create]
  end

  resources :tracks

end
