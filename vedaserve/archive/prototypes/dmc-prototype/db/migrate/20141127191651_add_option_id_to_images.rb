class AddOptionIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :option_id, :integer
  end
end
