class AddColorToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :color, :integer
  end
end
