class AddCompletedSuccessfullyColumnToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :completed_successfully, :boolean, default: false
  end
end
