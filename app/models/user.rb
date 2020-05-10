class User < ApplicationRecord
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable, 
         :validatable,
         :confirmable

  has_many :gists, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id, dependent: :destroy

  def sort_by(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
