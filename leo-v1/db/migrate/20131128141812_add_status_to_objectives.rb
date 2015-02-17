class AddStatusToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :status, :string
  end
end
