class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.boolean :enable
      t.integer :research_id

      t.timestamps
    end
  end
end
