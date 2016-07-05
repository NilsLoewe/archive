class AddInfosToOptions < ActiveRecord::Migration
  def change
    add_column :options, :link, :string
    add_column :options, :description, :string
  end
end
