class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,
                :logged_in?
  before_action :authenticate_user!

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end

    # куки храним для пользователя, чтобы после аутентификации
    # он перешел на целевую страницу, куда изначально намеревался попасть
    # метод храним чтобы определять какой запрос используется,
    # redirect_to не отправляет POST, используентся gem 'repost'
    # нужен, если пользователь не залогинился но нажимает Start, для прохождения теста
    cookies[:user_request_path] = request.path
    cookies[:user_request_method] = request.method
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
