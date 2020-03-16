class Category < ApplicationRecord
  has_many: tests

  default_scope { oreder(title: :asc) }
end
