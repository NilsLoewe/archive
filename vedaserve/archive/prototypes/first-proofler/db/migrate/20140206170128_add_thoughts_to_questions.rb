class AddThoughtsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :thoughts, :text
  end
end
