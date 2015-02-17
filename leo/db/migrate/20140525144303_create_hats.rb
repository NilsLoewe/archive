class CreateHats < ActiveRecord::Migration
  def change
    create_table :hats do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
