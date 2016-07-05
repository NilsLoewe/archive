class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.integer :option_id
      t.string :title
      t.string :content
      t.string :link
      t.string :source

      t.timestamps
    end
  end
end
