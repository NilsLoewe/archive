class AddClosedToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :closed, :boolean
    add_column :decisions, :chosen_option, :integer
  end
end
