class RemoveUserIdFromDecisions < ActiveRecord::Migration
  def change
    remove_column :decisions, :user_id
  end
end
