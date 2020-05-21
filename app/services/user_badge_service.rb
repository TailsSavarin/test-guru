class UserBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def badges_unlock
    Badge.all.select do |badge|
      send("#{badge.rule}_award", badge)
    end
  end

  private

  def first_try_award(badge)
    return unless @test_passage.completed_successfully && @user.tests.where(id: @test.id).count == 1

    @user.badges.push(badge)
  end

  def all_tests_by_category_award(badge)
    category_id = badge.value.to_i

    return if category_id != @test.category_id

    test_ids = Test.with_questions.where(category_id: category_id).pluck(:id)
    @user.badges.push(badge) if @user.tests_passed?(test_ids)
  end

  def all_tests_by_level_award(badge)
    level = badge.value.to_i

    return if level != @test.level
  
    test_ids = Test.with_questions.where(level: level).pluck(:id)
    @user.badges.push(badge) if @user.tests_passedt?(test_ids)
  end
end
