class AddIndexToObjectives < ActiveRecord::Migration
  def change
    add_index :objectives, [:user_id, :created_at]
  end
end
