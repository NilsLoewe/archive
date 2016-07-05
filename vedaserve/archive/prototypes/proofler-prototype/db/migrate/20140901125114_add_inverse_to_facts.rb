class AddInverseToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :inverse, :boolean
  end
end
