class AddStatusToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :chosen, :string
  end
end
