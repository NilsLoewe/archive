class RemoveNameFromDocuments < ActiveRecord::Migration
  def up
    remove_column :documents, :name
  end

  def down
    add_column :documents, :name, :string
  end
end
