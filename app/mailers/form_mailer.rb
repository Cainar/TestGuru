class FormMailer < ApplicationMailer
  def new_form_email(user, feedback)
    @user = user
    @feedback = feedback
    @target_email = Admin.last.email
    mail to: @target_email, subject: 'Yuo just completed the TestGuru test!'
  end
end
