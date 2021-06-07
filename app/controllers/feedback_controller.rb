class FeedbackController < ApplicationController
  before_action :set_feedback, only: [:destroy]
  before_action :set_user, only: %i[create landing]

  def index
    @feedbacks = Feedback.all
  end

  def landing
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    success = verify_recaptcha(action: 'feedback', secret_key: "6Lf2kxIbAAAAAOQuJqoKiTvECRFGAU0ghycROmqM")
    # recaptcha пока не работает, проверку не проходит, поэтому unless
    if success  
      respond_to do |format|
        if @feedback.save
          FormMailer.new_form_email(@user, @feedback).deliver_now
          format.html { redirect_to '/', notice: 'The feedback was successfully created.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to '/', alert: "Failure. feedback wasn't created." }
      end
    end
  end

  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'feedback was successfully destroyed.' }
    end
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end

  def set_user
    @user = current_user
  end
end
