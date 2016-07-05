class AddAnswerToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :short_answer, :string
    add_column :questions, :answer, :text
  end
end
