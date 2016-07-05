class AddRatedToOption < ActiveRecord::Migration
  def change
    add_column :options, :rated, :boolean
  end
end
