class AddUserIdToHats < ActiveRecord::Migration
  def change
    add_column :hats, :user_id, :integer
  end
end
