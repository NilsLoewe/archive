class AddCreatorIdToFact < ActiveRecord::Migration
  def change
    add_column :facts, :creator_id, :integer
  end
end
