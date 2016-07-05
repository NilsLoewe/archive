class AddOptionIdToOptionAssets < ActiveRecord::Migration
  def change
    add_column :option_assets, :option_id, :integer
  end
end
