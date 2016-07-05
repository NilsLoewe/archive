class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :side
      t.integer :option_id
      t.integer :argument_id
      t.integer :value

      t.timestamps
    end
  end
end
