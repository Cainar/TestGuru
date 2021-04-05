class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      cookies[:user_request_path] ? destination_redirect : (redirect_to root_path)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete :user_request_path
    cookies.delete :user_request_method
    redirect_to login_path
  end
end

private

# определяет какой метод запроса использовать GET или POST
# используется когда незалогиненный пользователь нажимает Start для начала теста
def destination_redirect
  if cookies[:user_request_method] == 'POST'
    redirect_post cookies[:user_request_path], options: {authenticity_token: :auto}
  else
    redirect_to cookies[:user_request_path]
  end
end
