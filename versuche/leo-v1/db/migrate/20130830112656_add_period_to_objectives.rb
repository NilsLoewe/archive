class AddPeriodToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :period, :integer
  end
end
