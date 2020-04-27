class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:target_url] = request.url
      redirect_to login_path, alert: 'Please Sign in'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
