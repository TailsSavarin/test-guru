class AddBadgesRuleNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:badges, :rule, false)
  end
end
