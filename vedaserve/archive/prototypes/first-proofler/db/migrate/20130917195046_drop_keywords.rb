class DropKeywords < ActiveRecord::Migration
  def up
    drop_table :keywords
  end

  def down
  end
end
