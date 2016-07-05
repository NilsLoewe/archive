class AddNegToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :neg, :boolean
  end
end
