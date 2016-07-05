class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
      t.string :description

      t.timestamps
    end
  end
end
