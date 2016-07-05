class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.string :title
      t.integer :decision_id

      t.timestamps
    end
  end
end
