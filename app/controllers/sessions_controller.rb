class SessionsController < ApplicationController
  def create
    auth_hash = env['omniauth.auth'].to_h
    user = User.find_or_create_from_omniauth(auth_hash)
    if user.persisted?
      flash[:notice] = "Successfully signed in as #{user.nickname}"
      redirect_to root_path
    end
  end
end
