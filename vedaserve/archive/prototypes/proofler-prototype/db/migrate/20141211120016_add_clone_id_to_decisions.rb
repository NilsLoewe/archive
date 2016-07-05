class AddCloneIdToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :clone_id, :integer
  end
end
