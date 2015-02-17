class AddSprinttitleToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :sprinttitle, :string
  end
end
