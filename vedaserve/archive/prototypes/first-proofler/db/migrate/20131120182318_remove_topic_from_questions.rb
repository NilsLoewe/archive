class RemoveTopicFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :topic
  end

  def down
    add_column :questions, :topic, :integer
  end
end
