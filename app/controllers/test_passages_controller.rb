class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show
    
  end

  def result
    
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    @user = @test_passage.user
    if @test_passage.completed?
      @test_passage.update(rate: @test_passage.success_rate)
      
      CheckRule.call(test_passage: @test_passage)
      badge_result = BadgeRule.result
      badge_result.each do |achievement, result|
        @badge = Badge.where(name: achievement::NAME)
        puts @badge
        puts achievement::MULTIPLY
        puts result
        if result
          if @user.badges.where(name: achievement::NAME).count == 0
            @achievement = @user.badges.push(@badge)
          elsif achievement::MULTIPLY
            @achievement = @user.badges.push(@badge)
          end
        end
      end
                                                     
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
