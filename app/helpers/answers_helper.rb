module AnswersHelper
  def answer_status(answer)
    if answer.correct
      t('.correct_answer')
    else
      t('.wrong_answer')
    end
  end
end
