module TestPassagesHelper
  def test_complete_message(test_passage)
    test_passage.success? ? t('.test_pass_success') : t('.test_pass_fail')
  end

  def url
    "https://gist.github.com/#{github_id}"
  end
end
