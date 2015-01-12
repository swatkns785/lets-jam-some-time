Rails.application.routes.draw do

  root to: "homes#index"
  get 'auth/soundcloud/callback', to: "sessions#create"

end
