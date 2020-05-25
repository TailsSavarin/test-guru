class Badge < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :rule, :image, :description, presence: true

end
