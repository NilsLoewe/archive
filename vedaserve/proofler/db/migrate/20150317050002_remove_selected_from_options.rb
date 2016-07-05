class RemoveSelectedFromOptions < ActiveRecord::Migration
  def change
    remove_column :options, :selected, :boolean
  end
end
