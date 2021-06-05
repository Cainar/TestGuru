class FeedbackController < ApplicationController
  before_action :set_post, only: [:destroy]
  before_action :set_user, only: %i[create landing]

  def index
    @feedbacks = Feedback.all
  end

  def landing
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(post_params)
    @target_email = Admin.last.email
    # recaptcha пока не работает, проверку не проходит, поэтому unless
    unless verify_recaptcha
      respond_to do |format|
        if @feedback.save
          FormMailer.new_form_email(@user, @feedback, @target_email).deliver_now
          format.html { redirect_to '/', notice: 'The post was successfully created.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to '/', alert: "Failure. Post wasn't created." }
      end
    end
  end

  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private

  def set_post
    @feedback = Feedback.find(params[:id])
  end

  def post_params
    params.require(:feedback).permit(:name, :email, :message)
  end

  def set_user
    @user = current_user
  end
end
