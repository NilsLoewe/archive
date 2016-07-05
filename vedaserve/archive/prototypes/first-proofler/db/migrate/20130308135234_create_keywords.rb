class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :content
      t.integer :question_id

      t.timestamps
    end
  end
end
