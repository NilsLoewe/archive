class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title
      t.integer :decision_id

      t.timestamps
    end
  end
end
