class SessionsController < ApplicationController

  before_action :set_user, :only %i[new, create]

  def new

  end

  def create
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find_by(email: params[:email])
  end
end
