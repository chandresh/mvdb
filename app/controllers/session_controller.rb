class SessionController < ApplicationController
  def new
  end

  def create


    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])

      session[:user_id] = user.id

      redirect_to root_url, notice: 'Success!'
    else
      redirect_to new_session_url, alert: 'Failed!'
    end

  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_url, notice: 'Success!'
  end
end
