class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_omniauth(auth_hash)

    if user.persisted?
      set_current_user(user)
      flash[:notice] = "Successfully signed in as #{user.nickname}"
      redirect_to root_path
    else
      flash[:alert] = "Unable to sign in."
    end
  end

  private

  def auth_hash
    env['omniauth.auth'].to_h
  end
end
