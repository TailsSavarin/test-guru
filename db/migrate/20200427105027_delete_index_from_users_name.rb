class DeleteIndexFromUsersName < ActiveRecord::Migration[6.0]
  def change
    remove_index(:users, :first_name)
  end
end
