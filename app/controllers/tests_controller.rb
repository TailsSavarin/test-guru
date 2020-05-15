class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: :start

  def index
    @tests = Test.with_questions
  end

  def start
    if @test
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test), notice: t('.after_start_greeting') 
    else
      redirect_to :index, notice: t('.no_questions')
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
