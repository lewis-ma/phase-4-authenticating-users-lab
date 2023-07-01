class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      render json: user
    else
      render json: { error: 'Invalid username' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    head :no_content
  end
end
