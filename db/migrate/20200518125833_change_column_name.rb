class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :badges, :value, :description
  end
end
