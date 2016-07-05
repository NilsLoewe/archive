class AddQuestionToAllocations < ActiveRecord::Migration
  def change
    add_column :allocations, :question, :boolean
  end
end
