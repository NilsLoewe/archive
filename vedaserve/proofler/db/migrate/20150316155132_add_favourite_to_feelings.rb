class AddFavouriteToFeelings < ActiveRecord::Migration
  def change
    add_column :feelings, :favourite, :boolean
  end
end
