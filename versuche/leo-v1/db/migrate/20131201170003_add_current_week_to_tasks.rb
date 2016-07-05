class AddCurrentWeekToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :current_week, :boolean
  end
end
