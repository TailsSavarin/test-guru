class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true,
                    uniqueness: { scope: :level }

  validates :level, :timer, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :with_questions, -> { joins(:questions).group('tests.id') }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_level, ->(level) { where(level: level) }

  scope :by_category_title, ->(category_title) { joins(:category).where(categories: { title: category_title }) }

  def self.sort_by(category_title)
    by_category_title(category_title).order(title: :desc).pluck(:title)
  end

  def timer_value_positive?
    timer.positive?
  end
end
