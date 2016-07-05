class CreateGuts < ActiveRecord::Migration
  def change
    create_table :guts do |t|
      t.integer :option_id
      t.integer :user_id
      t.integer :value

      t.timestamps
    end
  end
end
