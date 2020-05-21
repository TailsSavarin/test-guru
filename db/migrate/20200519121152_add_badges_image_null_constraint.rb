class AddBadgesImageNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:badges, :image, false)
  end
end
