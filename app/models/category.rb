class Category < ApplicationRecord
  has_many: tests

  validates :title, presence: true

  default_scope { oreder(title: :asc) }
end
