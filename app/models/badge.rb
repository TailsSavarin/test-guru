class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :rule, presence: true
  validates :image, presence: true
  validates :description, presence: true

  default_scope { order(title: :asc) }
end
