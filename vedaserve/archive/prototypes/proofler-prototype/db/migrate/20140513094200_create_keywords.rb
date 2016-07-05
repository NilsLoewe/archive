class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :title
      t.integer :decision_id

      t.timestamps
    end
  end
end
