class CreateVisions < ActiveRecord::Migration
  def change
    create_table :visions do |t|
      t.string :description

      t.timestamps
    end
  end
end
