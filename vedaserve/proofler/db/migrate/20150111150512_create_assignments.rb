class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :option_id
      t.integer :fact_id
      t.string :value

      t.timestamps null: false
    end
  end
end
