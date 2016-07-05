class AddColumnToDocumentTemplates < ActiveRecord::Migration
  def change
    add_column :document_templates, :type, :integer
  end
end
