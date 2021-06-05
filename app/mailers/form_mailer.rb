class FormMailer < ApplicationMailer
  def new_form_email(user, feedback, email)
    @user = user
    @feedback = feedback
    mail to: email, subject: 'Yuo just completed the TestGuru test!'
  end
end
