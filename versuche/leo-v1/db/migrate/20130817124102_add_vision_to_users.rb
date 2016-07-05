class AddVisionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vision, :text
  end
end
