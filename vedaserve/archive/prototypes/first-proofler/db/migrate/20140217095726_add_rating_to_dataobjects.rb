class AddRatingToDataobjects < ActiveRecord::Migration
  def change
    add_column :dataobjects, :rating, :integer
  end
end
