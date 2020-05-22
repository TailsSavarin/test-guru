class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def current
    @badges = current_user.badges
  end
end
