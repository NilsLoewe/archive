class AddFactIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :fact_id, :integer
  end
end
