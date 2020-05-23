class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :rule, :image, :description, presence: true

  default_scope { order(title: :asc) }
end
