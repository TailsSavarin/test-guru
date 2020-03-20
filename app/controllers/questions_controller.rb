class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_questions, only: %i[show destroy]

  rescue_form ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
  end

  def show  
  end

  def new
    @question = @test.questions.new
  end
  
  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    @questions.destroy
    render plain: 'Question deleted'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_question_not_found
    render plain: 'Question not found'
  end
end