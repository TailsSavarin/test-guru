class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    body = params[:feedback][:body]

    if body.present?
      FeedbacksMailer.feedback(current_user, body).deliver_now 
      redirect_to root_path, notice: t('.thanks')
    else
      redirect_to new_feedback_path, alert: t('.try_again')
  end
end
