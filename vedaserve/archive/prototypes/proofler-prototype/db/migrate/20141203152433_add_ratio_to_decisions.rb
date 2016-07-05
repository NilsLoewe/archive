class AddRatioToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :ratio, :integer
  end
end
