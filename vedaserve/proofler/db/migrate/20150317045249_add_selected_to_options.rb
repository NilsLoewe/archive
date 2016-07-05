class AddSelectedToOptions < ActiveRecord::Migration
  def change
    add_column :options, :selected, :boolean
  end
end
