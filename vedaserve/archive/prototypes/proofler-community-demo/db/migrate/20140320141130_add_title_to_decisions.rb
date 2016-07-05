class AddTitleToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :title, :string
  end
end
