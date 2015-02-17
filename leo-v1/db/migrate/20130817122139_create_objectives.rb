class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.string :title
      t.text :description
      t.boolean :prio
      t.integer :category_id
      t.boolean :done
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
