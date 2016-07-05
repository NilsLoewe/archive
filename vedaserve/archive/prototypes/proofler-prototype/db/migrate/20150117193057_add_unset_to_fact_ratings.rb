class AddUnsetToFactRatings < ActiveRecord::Migration
  def change
    add_column :fact_ratings, :unset, :boolean, :default => false
  end
end
