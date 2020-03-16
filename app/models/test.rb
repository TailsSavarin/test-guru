class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..3) }
  scope :hard, -> { where(level: 4..Float::INFINITY) }
  scope :by_category_title, -> (category_title) { joins(:category).where(categories: { title: category_title })

  def self.sort_by(category_title)
    by_category_title(category_title).order(title: :desc).pluck(:title)
  end
end
