class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title
      t.string :url
      t.boolean :WebSearch
      t.boolean :DatabaseSearch
      t.boolean :LibrarySearch
      t.boolean :Interview

      t.timestamps
    end
  end
end
