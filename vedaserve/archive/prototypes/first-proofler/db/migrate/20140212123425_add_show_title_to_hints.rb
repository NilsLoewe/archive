class AddShowTitleToHints < ActiveRecord::Migration
  def change
    add_column :hints, :show_title, :boolean
  end
end
