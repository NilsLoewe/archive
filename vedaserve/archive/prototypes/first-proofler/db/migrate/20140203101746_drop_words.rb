class DropWords < ActiveRecord::Migration
  def up
    drop_table :words
  end

  def down
  end
end
