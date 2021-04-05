class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:path].present?
        if cookies[:method] == 'POST'
          redirect_post cookies[:path], options: {authenticity_token: :auto}
        else
          redirect_to cookies[:path]
        end
      else
        redirect_to tests_path
      end
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
