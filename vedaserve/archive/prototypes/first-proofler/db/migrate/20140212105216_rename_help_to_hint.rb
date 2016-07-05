class RenameHelpToHint < ActiveRecord::Migration
  def change
    rename_table :helps, :hints
  end
end
