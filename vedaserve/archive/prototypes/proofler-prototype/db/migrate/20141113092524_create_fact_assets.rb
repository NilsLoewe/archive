class CreateFactAssets < ActiveRecord::Migration
  def change
    create_table :fact_assets do |t|
      t.string :title
      t.string :description
      t.integer :fact_id

      t.timestamps
    end
  end
end
