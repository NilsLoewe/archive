class RenameRatingsToFactRatings < ActiveRecord::Migration
  def change
    rename_table 'ratings', 'fact_ratings'
  end
end
