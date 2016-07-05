class RemoveSideFromRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :side
    remove_column :ratings, :option_id
    remove_column :ratings, :argument_id
    remove_column :ratings, :value
  end
end
