class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :objective_id
      t.string :status
      t.integer :size

      t.timestamps
    end
  end
end
