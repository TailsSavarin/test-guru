class Admin::QuestionsController < Admin::BaseController

  before_action :set_test, only: %i[index new create]
  before_action :set_question, only: %i[show edit update destroy]

  def show  
  end

  def new
    @question = @test.questions.new
  end
  
  def edit
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save 
      flash[:notice] = "Question was created successuflly!"
      redirect_to admin_question_path(@question)  
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      flash[:notice] = "Question was updated successuflly!"
      redirect_to admin_question_path@question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:notice] = "Question was deleted successuflly!"
    redirect_to admin_test_path(@question.test)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
