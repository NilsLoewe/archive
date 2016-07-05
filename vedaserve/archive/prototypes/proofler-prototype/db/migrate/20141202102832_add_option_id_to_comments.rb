class AddOptionIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :option_id, :integer
  end
end
