module AnswersHelper
  def answer_status(answer)
    if answer.correct
      'Correct Answer'
    else
      'Invalid Answer'
    end
  end
end
