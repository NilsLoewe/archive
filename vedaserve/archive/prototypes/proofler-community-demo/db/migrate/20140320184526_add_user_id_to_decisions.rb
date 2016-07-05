class AddUserIdToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :user_id, :integer
  end
end
