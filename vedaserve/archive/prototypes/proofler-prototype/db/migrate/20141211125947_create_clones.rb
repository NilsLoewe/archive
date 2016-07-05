class CreateClones < ActiveRecord::Migration
  def change
    create_table :clones do |t|
      t.integer :decision_id
      t.integer :clone_id

      t.timestamps
    end
  end
end
