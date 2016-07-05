class AddDirectionToAllocation < ActiveRecord::Migration
  def change
    add_column :allocations, :direction, :boolean
  end
end
