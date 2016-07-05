class AddHighlightToDataobjects < ActiveRecord::Migration
  def change
    add_column :dataobjects, :highlight, :boolean
  end
end
