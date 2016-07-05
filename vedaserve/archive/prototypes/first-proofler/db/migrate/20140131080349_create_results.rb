class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.text :content
      t.string :url
      t.string :type

      t.timestamps
    end
  end
end
