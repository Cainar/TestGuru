module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to "#{repo}", 
            "https://github.com/#{author}/#{repo}.git", 
            target: :_blank
  end

  def flash_style(key)
    case key
    when 'notice'
      'alert-success'
    when 'alert'
      'alert-danger'
    else
      'alert-info'
    end
  end
end
