class FeedbacksMailer < ApplicationMailer
  def feedback(user, body)
    @body = body
    @user = user

    mail to: Admin.pluck(:email)
  end
end
