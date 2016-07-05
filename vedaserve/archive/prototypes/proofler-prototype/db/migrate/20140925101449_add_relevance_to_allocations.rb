class AddRelevanceToAllocations < ActiveRecord::Migration
  def change
    add_column :allocations, :relevant, :boolean
  end
end
