class AddStateToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :state, :string
  end
end
