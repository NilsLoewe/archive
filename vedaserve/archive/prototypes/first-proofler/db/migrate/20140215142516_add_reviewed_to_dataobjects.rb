class AddReviewedToDataobjects < ActiveRecord::Migration
  def change
    add_column :dataobjects, :reviewed, :boolean
    add_column :dataobjects, :note, :text
  end
end
