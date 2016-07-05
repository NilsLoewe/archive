class AddDatatypeToFact < ActiveRecord::Migration
  def change
    add_column :facts, :datatype, :string
  end
end
