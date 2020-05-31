class User < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  has_many :gists, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id, dependent: :destroy

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def sort_by(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def tests_passed(test_ids)
    test_passages.completed_successfully.where(test_id: test_ids).map(&:test_id).uniq.sort
  end
end
