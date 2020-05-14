class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    body = params[:body]

    FeedbacksMailer.feedback(current_user, body).deliver_now if body.present?
    redirect_to root_path, notice: t('.thanks')
  end
end
