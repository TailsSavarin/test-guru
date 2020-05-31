class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def reult; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? || @test_passage.timeout?
      if @test_passage.success?
        @test_passage.update_attributes(completed_successfully: true)
        UserBadgeService.new(@test_passage).badges_unlock
      end
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage), notice: t('.badges')
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    service = GistQuestionService.new(question)
    result = service.call

    if service.success?
      current_user.gists.create(question: question, github_id: result.id)
      redirect_to @test_passage, notice: t('.success', link: result[:html_url])
    else
      redirect_to @test_passage, alert: t('.failure')
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
