class UserBadgeController < ApplicationController
  before_action :set_user, only: %i[index]

  def index
    badges = @user.badges
  end


  private

  def set_user
    @user = current_user
  end
end
