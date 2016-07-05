class ChangeTypeFormatInSearches < ActiveRecord::Migration
  def change
    change_column :searches, :type, :string
  end
end
