class AddConstraintsToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :constrains, :string
  end
end
