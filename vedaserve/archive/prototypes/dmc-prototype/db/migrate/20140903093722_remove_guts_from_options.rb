class RemoveGutsFromOptions < ActiveRecord::Migration
  def change
    remove_column :options, :guts
  end
end
