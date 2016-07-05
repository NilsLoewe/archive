class RemoveResearchIdFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :research_id
  end

  def down
    add_column :questions, :research_id, :integer
  end
end
