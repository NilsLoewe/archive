class AddIdsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :fact1, :integer
    add_column :questions, :fact2, :integer
  end
end
