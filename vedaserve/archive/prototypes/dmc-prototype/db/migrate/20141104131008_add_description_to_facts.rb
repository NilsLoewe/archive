class AddDescriptionToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :description, :string
  end
end
