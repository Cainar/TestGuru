class GistQuestionService
  attr_accessor :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || http_client
  end

  def success?
    @client.last_response.status == SUCCESS_RESPONSE_STATUS
  end

  def call
    @client.access_token = ENV['GIST_TOKEN']
    @client.create_gist(gist_params)
  end

  def last_response_status
    @client.last_response.status
  end

  private

  SUCCESS_RESPONSE_STATUS = 201

  def gist_params
    {
      description: I18n.t('common.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def http_client
    Octokit::Client.new
  end 
end
