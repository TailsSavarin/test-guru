class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_test_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = current_user.authored_tests.new(test_params)
    
    if @test.save 
      flash[:notice] = "Test was created successuflly!"
      redirect_to admin_test_path(@test) 
    else
      render :new
    end
  end

  def update
    if @test.update(test_params) 
      flash[:notice] = "Test was updated successuflly!"
      redirect_to admin_test_path(@test) 
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    flash[:notice] = "Test was deleted successuflly!"
    redirect_to admin_tests_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :title, :level, :user_id)
  end

  def rescue_test_not_found
    render plain: 'Test not found'
  end
end
