class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
      t.integer :value
      t.integer :option_id
      t.integer :participant_id

      t.timestamps null: false
    end
  end
end
