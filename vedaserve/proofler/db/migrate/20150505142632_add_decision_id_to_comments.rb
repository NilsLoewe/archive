class AddDecisionIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :decision_id, :integer
  end
end
