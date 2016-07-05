class CreateReseraches < ActiveRecord::Migration
  def change
    create_table :reseraches do |t|

      t.timestamps
    end
  end
end
