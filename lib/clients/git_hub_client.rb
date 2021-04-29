class GitHubClient
  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.access_token = ENV['GIST_TOKEN']
    @http_client.create_gist(params)
  end

  def last_response_status
    @http_client.last_response.status
  end

  private

  def setup_http_client
    Octokit::Client.new
  end 
end
