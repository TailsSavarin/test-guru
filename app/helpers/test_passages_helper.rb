module TestPassagesHelper
  def test_complete_message(test_passage)
    if test_passage.success?
      t('.test_pass_succes')
    else
      t('.test_pass_fail')
    end
  end
  
  def colored_result(test_passage)
    color = test_passage.success? ? 'lime' : 'firebrick'
    "<span style='color: #{color}'>
    #{format('%d', test_passage.success_percent)}</span>".html_safe
  end
end
