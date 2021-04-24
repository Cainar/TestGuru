module ApplicationHelper
  FLASH_TYPES = {
    notice: 'alert-success',
    alert: 'alert-danger'
  }

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to "#{repo}", 
            "https://github.com/#{author}/#{repo}.git", 
            target: :_blank
  end

  def flash_style(key)
    FLASH_TYPES[key.to_sym]
  end
end
