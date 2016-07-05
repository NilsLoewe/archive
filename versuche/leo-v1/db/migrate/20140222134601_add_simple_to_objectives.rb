class AddSimpleToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :simple, :boolean
  end
end
