class AddSprintEndToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :sprint_end, :date
  end
end
