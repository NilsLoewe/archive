class AddDoneToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :done, :boolean
  end
end
