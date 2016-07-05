class CreateOptionAssets < ActiveRecord::Migration
  def change
    create_table :option_assets do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
