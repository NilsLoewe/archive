class DropArguments < ActiveRecord::Migration
  def change
    drop_table :arguments
  end
end
