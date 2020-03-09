class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.integer :level

      t.timestamps
    end
  end
end
