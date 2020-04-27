class ChangeUsersFirstNameNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :first_name, true)
  end
end
