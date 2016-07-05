class CreateFactRatings < ActiveRecord::Migration
  def change
    create_table :fact_ratings do |t|
      t.integer :user_id
      t.integer :fact_id
      t.integer :value

      t.timestamps
    end
  end
end
