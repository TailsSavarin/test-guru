module AnswersHelper
  def answer_status(answer)
    answer.correct ? t('.correct_answer') : t('.wrong_answer')
  end
end
