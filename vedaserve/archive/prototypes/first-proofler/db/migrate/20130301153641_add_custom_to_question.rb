class AddCustomToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :custom, :boolean
  end
end
