class CreateAssignmentRating < ActiveRecord::Migration
  def change
    create_table :assignment_ratings do |t|
      t.integer :assignment_id
      t.integer :participant_id
      t.integer :rating

      t.timestamps null: false
    end
  end
end
