class AddNoteToHints < ActiveRecord::Migration
  def change
    add_column :hints, :note, :string
  end
end
