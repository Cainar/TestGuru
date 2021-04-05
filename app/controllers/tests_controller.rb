class TestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_test, only: %i[show, edit, update, destroy, start]
  before_action :set_question, only: :show
  before_action :current_user, only: :start

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_question
    
  end
end
