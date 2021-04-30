class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show
    
  end

  def result
    
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call
    flash_options = if service.success?
      Gist.create(question: @test_passage.current_question,
                  user: @test_passage.user,
                  gist_url: result[:url])
      { notice: "#{helpers.link_to "Gist", result.html_url, target: "_blank"} #{t('.success')}" }
    else
      { alert: t('.failure') }
    end
      
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
