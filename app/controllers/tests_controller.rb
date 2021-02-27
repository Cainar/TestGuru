class TestsController < ApplicationController
  before_action :set_test, only: %i[show, edit, update, destroy, start]
  before_action :set_question, only: :show
  before_action :set_user, only: :start

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_user
    @user = User.first
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_question
    
  end
end
