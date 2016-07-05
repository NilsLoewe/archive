class RenameFactColumns < ActiveRecord::Migration
  def change
    add_column :questions, :fact1_id, :integer
    add_column :questions, :fact2_id, :integer
  end
end
