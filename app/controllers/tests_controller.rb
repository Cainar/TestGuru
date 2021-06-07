class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def start
    if @test.questions.count > 0
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to tests_path, alert: "There are no questions in the test"
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
