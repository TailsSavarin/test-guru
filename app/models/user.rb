class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true

  def sort_by(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
