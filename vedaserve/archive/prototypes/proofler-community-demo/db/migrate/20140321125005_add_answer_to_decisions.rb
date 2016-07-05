class AddAnswerToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :answer, :string
  end
end
