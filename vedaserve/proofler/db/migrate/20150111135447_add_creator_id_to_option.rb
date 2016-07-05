class AddCreatorIdToOption < ActiveRecord::Migration
  def change
    add_column :options, :creator_id, :integer
  end
end
