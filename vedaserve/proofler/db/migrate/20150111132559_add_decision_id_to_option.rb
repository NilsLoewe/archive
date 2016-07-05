class AddDecisionIdToOption < ActiveRecord::Migration
  def change
    add_column :options, :decision_id, :integer
  end
end
