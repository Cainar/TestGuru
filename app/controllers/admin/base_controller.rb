class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :admin_reqiured!

  private

  def admin_reqiured!
    redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.is_a?(Admin)
  end
end
