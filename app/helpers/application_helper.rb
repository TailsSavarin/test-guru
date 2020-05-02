module ApplicationHelper
  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def other_url(title)
    link_to title.capitalize, "http://www.#{title}.com/", target: '_blank'
  end

  def current_year
    Time.now.year
  end

  def current_time
    I18n.l(Time.current, format: :short)
  end
end
