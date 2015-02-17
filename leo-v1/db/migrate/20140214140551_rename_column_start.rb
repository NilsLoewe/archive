class RenameColumnStart < ActiveRecord::Migration
  def self.up
    rename_column :objectives, :start_date, :sprint_start
  end

  def self.down
  end
end
