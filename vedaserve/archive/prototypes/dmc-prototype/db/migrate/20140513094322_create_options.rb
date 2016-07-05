class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :title
      t.integer :decision_id
      t.integer :guts

      t.timestamps
    end
  end
end
