class AddShowDisableToHints < ActiveRecord::Migration
  def change
    add_column :hints, :show_disable, :boolean
  end
end
