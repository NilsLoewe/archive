class AddClonedToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :cloned, :boolean
  end
end
