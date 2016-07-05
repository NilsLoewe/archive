class AddAdminIdToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :admin_id, :integer
  end
end
