class FeedbacksMailer < ApplicationMailer
  def feedback(user, body)
    @user = user
    @body = body

    mail to: ENV['SMTP_USERNAME'], subject: "FeedBack"
  end
end
