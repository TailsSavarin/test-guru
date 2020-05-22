class AddRuleAndValueToBadge < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :rule, :string
    add_column :badges, :value, :string
  end
end
