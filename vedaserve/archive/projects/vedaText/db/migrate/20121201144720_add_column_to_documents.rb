class AddColumnToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :type, :integer
  end
end
