class RemoveColumnFromDocuments < ActiveRecord::Migration
  def up
    remove_column :documents, :remember_token
  end

  def down
    add_column :documents, :remember_token, :string
  end
end
