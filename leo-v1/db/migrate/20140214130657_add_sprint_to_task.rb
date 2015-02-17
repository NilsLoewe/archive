class AddSprintToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :sprint, :boolean
  end
end
