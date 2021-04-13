class Admin::TestsController < Admin::BaseController
  before_action :set_question, only: :show
  before_action :set_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all 
  end

  def show
 
  end

  def new
    @test = current_user.created_tests.new
  end

  def edit
    
  end

  def create
    @test = current_user.created_tests.new(new_test_params)

    if @test.save 
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(new_test_params) 
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_question
    
  end

  def new_test_params
    params.require(:test).permit(:id, :title, :level, :category_id)
  end

  def test_params
    params.permit([:id])
  end
end
