class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :title
      t.string :description
      t.integer :type
      t.integer :question_id

      t.timestamps
    end
  end
end
