class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.integer :option_id
      t.integer :fact_id

      t.timestamps
    end
  end
end
