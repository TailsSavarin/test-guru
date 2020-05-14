class FeedbacksMailer < ApplicationMailer
  def feedback(user, body)
    @body = body
    @user = user

    mail to: ENV['SMTP_USERNAME'], subject: "FeedBack"
  end
end
