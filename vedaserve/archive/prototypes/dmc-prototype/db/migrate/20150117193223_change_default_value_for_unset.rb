class ChangeDefaultValueForUnset < ActiveRecord::Migration
  def change
    change_column :fact_ratings, :unset, :boolean, :default => true
  end
end
