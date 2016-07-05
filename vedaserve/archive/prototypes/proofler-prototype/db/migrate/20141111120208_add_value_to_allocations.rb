class AddValueToAllocations < ActiveRecord::Migration
  def change
    add_column :allocations, :value, :string
  end
end
