class CreateDataobjects < ActiveRecord::Migration
  def change
    create_table :dataobjects do |t|
      t.string :title
      t.string :type
      t.string :content
      t.integer :result_id

      t.timestamps
    end
  end
end
