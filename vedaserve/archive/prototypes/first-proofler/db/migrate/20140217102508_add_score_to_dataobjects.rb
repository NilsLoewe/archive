class AddScoreToDataobjects < ActiveRecord::Migration
  def change
    add_column :dataobjects, :score, :integer
  end
end
