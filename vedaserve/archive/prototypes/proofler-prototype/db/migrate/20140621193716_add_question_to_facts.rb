class AddQuestionToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :question, :boolean
    add_column :facts, :old, :string
  end
end
