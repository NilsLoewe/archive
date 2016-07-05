class AddDurationToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :start_date, :date
    add_column :objectives, :duration, :integer
  end
end
