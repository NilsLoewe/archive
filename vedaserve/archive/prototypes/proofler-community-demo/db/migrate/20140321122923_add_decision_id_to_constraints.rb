class AddDecisionIdToConstraints < ActiveRecord::Migration
  def change
    add_column :constraints, :decision_id, :integer
  end
end
