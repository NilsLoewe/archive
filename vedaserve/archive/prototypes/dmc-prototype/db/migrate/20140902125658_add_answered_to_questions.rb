class AddAnsweredToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answered, :bool
    add_column :questions, :chosen, :integer
  end
end
