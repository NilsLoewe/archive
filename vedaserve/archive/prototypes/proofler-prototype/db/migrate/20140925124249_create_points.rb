class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :fact_id
      t.integer :participant_id
      t.integer :value

      t.timestamps
    end
  end
end
