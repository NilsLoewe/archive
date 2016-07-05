class CreateInterviewResult < ActiveRecord::Migration
  def change
    create_table(:interview_results) do |t|
      t.integer :question_id
      t.string :content
      t.string :keywords
      t.timestamps
    end
  end
end
