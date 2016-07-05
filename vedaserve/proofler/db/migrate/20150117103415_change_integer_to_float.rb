class ChangeIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :feelings, :value, :float
    change_column :ratings, :value, :float
  end
end
