class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question1_id
      t.integer :question2

      t.timestamps
    end
  end
end
