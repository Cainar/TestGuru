class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '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'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.access_token = ACCESS_TOKEN
    @http_client.create_gist(params)
  end

  private

  def setup_http_client
    Octokit::Client.new
  end
  
end
