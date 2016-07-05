class AddDecisionIdToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :decision_id, :integer
  end
end
