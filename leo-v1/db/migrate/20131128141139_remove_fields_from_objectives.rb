class RemoveFieldsFromObjectives < ActiveRecord::Migration
  def up
    remove_column :objectives, :done
    remove_column :objectives, :prio
    remove_column :objectives, :start_date
    remove_column :objectives, :end_date
    remove_column :objectives, :period
  end

  def down
    add_column :objectives, :period, :integer
    add_column :objectives, :end_date, :date
    add_column :objectives, :start_date, :date
    add_column :objectives, :prio, :boolean
    add_column :objectives, :done, :boolean
  end
end
