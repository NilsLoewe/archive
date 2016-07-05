class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
