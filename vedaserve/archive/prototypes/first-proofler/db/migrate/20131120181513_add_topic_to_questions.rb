class AddTopicToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :topic, :integer
  end
end
