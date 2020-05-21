class AddValueToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :value, :integer
    change_column_null(:badges, :description, false)
  end
end
