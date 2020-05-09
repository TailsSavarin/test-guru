module TestPassagesHelper
  def test_complete_message(test_passage)
    test_passage.success? ? t('.test_pass_success') : t('.test_pass_fail')
  end

  def progress_bar(test_passage)
    progress_percent = test_passage.current_question_number.to_f/test_passage.test.questions.size * 100
    progress_percent.round
  end
end
