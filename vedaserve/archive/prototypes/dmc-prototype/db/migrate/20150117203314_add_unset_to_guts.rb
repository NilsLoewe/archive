class AddUnsetToGuts < ActiveRecord::Migration
  def change
    add_column :guts, :unset, :boolean, :default => true
  end
end
