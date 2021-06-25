class UserBadgesController < ApplicationController
  before_action :set_user, only: %i[index]

  def index
    @user_badges = @user.badges
    @badges = Badge.all
  end


  private

  def set_user
    @user = current_user
  end
end
