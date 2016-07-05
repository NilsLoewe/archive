class CreateConstraints < ActiveRecord::Migration
  def change
    create_table :constraints do |t|
      t.string :title

      t.timestamps
    end
  end
end
