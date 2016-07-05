class AddTagToHints < ActiveRecord::Migration
  def change
    add_column :hints, :tag, :string
  end
end
