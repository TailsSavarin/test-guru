class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :author_tests, class_name: 'Test'

  validates :email, presence: true

  def sort_by(level)
    tests.by_level(level)
  end
end
