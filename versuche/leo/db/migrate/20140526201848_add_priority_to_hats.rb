class AddPriorityToHats < ActiveRecord::Migration
  def change
    add_column :hats, :priority, :integer
  end
end
