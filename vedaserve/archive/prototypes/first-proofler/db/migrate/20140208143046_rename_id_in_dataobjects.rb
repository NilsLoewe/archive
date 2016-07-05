class RenameIdInDataobjects < ActiveRecord::Migration
  def self.up
    rename_column :dataobjects, :result_id, :search_id
  end

  def self.down
  end
end
