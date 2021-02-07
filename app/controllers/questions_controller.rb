class QuestionsController < ApplicationController
	before_action :find_test

	def index
		render plain: @test.questions.pluck(:id, :body)
	end

	def show
		@question = @test.questions.find(params[:id])
		render plain: @question.inspect
	end

	def new
		
	end

	def create
		# result = ["Class: #{params.class}, Parameters: #{params.inspect}"]
		#
		# render plain: result.join("\n")

		@question = Question.create(question_params)

		render plain: @question.inspect
	end

	def destroy

	end

	private

	def question_params
		params.require(:question).permit(:test_id, :body)
	end

	def find_test
		@test = Test.find(params[:test_id])
	end
end
