class AddArchiveToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :archive, :boolean, :default => false
    add_column :objectives, :parked, :boolean, :default => false
  end
end
