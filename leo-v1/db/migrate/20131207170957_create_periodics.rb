class CreatePeriodics < ActiveRecord::Migration
  def change
    create_table :periodics do |t|
      t.string :title
      t.integer :category_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
