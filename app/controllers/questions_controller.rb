class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_questions, only: %i[show destroy]

  def index
  end

  def show  
  end

  def new
    @question = @test.questions.new
  end
  
  def create
    @questions = @test.questions.new(question_params)
    render plain: 'Question created'
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

  def questions_params
    params.require(:question).permit(:body)
  end
end
