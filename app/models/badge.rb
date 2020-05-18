class Badge < ApplicationRecord

  BADGE_LIST = { 
    '1' => :test_badge1,
    '2' => :test_badge2
  }.freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :rule, presence: true

  default_scope { order(title: :asc) }
end
