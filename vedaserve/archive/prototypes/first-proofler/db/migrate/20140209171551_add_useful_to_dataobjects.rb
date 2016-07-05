class AddUsefulToDataobjects < ActiveRecord::Migration
  def change
    add_column :dataobjects, :useful, :boolean
  end
end
