class User < ApplicationRecord
  
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  validates :name, presence: true,
                   length: { in: 2..20 },
                   uniqueness: true
  validates :email, presence: true,
                    format: { with: EMAIL_FORMAT },
                    uniqueness: true
  has_secure_password

  def sort_by(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
