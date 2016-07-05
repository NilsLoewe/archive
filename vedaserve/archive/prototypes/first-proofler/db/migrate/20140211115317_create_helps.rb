class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :title
      t.string :lang
      t.text :text

      t.timestamps
    end
  end
end
