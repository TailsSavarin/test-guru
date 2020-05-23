module ApplicationHelper
  def current_year
    Time.now.year
  end

  def current_time
    I18n.l(Time.current, format: :short)
  end
end
